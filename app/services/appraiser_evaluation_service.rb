# frozen_string_literal: true

class AppraiserEvaluationService
  attr_reader :result
  
  def initialize(request_params)
    @request_params = request_params
  end
  
  def run!
    evaluation = Evaluation.find(@request_params.id)

    status = 6
    if @request_params.save == 'Save' || @request_params.save == 'Hoàn thành'
      status = 7
    end
    total_appraiser_point = 0
    total_factor = 0

    @request_params.evaluation_details.each do |rec|
      evaluation_detail = EvaluationDetail.find(rec.id)
      total_appraiser_point = total_appraiser_point + (rec.factor*rec.appraiser_point) if rec.appraiser_point.present?
      total_factor = total_factor + rec.factor

      evaluation_detail.update!(
        appraiser_point: rec.appraiser_point,
        appraiser_comment: rec.appraiser_comment
      )
    end

    appraiser_point = total_appraiser_point/total_factor if total_factor.positive?

    evaluation.update!(
      status: status,
      appraiser_point: appraiser_point.ceil(1)
    )

    @result = 'Cập nhật dữ liệu thành công.'
  end
end
