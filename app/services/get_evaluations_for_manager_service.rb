# frozen_string_literal: true

class GetEvaluationsForManagerService
  attr_reader :result
  
  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    @result = Evaluation.where(manager_id: @request_params.employee_id)
  end
end