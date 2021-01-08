# frozen_string_literal: true

class AdminEvaluationEditService
  attr_reader :result

   def initialize(request_params)
    @request_params = request_params
  end

  def run!
    evaluation = Evaluation.find(@request_params.id)

    evaluation.update!(
      manager_id: @request_params.manager_id,
      appraiser_id: @request_params.appraiser_id,
      status: @request_params.status
    )

    @result = 'Cập nhật dữ liệu thành công.'
  end
end
