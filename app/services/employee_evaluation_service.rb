# frozen_string_literal: true

class EmployeeEvaluationService
  attr_reader :result
  
  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    evaluation = Evaluation.find(@request_params.id)

    status = 1
    if @request_params.save == 'Save' || @request_params.save == 'Hoàn thành'
      status = 2 
    end
    evaluation.update!(
      status: status, 
      achievements: @request_params.achievements,
      positive_goals: @request_params.positive_goals,
      negative_goals: @request_params.negative_goals,
      overall_comments: @request_params.overall_comments
    )

    @request_params.evaluation_details.each do |rec|
      evaluation_detail = EvaluationDetail.find(rec.id)
      evaluation_detail.update!(
        employee_point: rec.employee_point,
        employee_comment: rec.employee_comment
      )
    end

    @result = 'Cập nhật dữ liệu thành công.'
  end
end
