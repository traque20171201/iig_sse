# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  def edit
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end

  def save
    request_params = EmployeeEvaluationRequestParams.new(params)
    request_params.validate!
    service = EmployeeEvaluationService.new(request_params)
    service.run!
    flash[:notice] = service.result
    redirect_to employee_evaluations_path
  end

  def show
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end
end
