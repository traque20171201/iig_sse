# frozen_string_literal: true

class EmployeeEvaluationFeedbackService
  attr_reader :result

  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    evaluation = Evaluation.find(@request_params.id)

    evaluation.update!(
      status: 5,
      one_one_date: @request_params.one_one_date,
      is_agree: @request_params.is_agree,
      employee_comments: @request_params.employee_comments
    )

    @result = 'Cập nhật dữ liệu thành công.'
  end
end
