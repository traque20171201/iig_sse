# frozen_string_literal: true

class GetEvaluationByEmployeeIdService
  attr_reader :result

  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    employee = Employee.find(@request_params.employee_id)
    evaluation = Evaluation.find_by(employee_id: @request_params.employee_id)
    manager = Employee.find(evaluation.manager_id) if evaluation.present?
    appraiser = Employee.find(evaluation.appraiser_id) if evaluation&.appraiser_id.present?

    @result = {
      evaluation: evaluation,
      employee: employee,
      manager: manager,
      appraiser: appraiser
    }
  end
end
