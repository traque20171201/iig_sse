# frozen_string_literal: true

class GetEvaluationByEmployeeIdService
  attr_reader :result

  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    evaluation = Evaluation.find_by(employee_id: @request_params.employee_id)

    @result = evaluation
  end
end
