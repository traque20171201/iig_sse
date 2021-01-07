# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  before_action :check_permission

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

  private

  def check_permission
    if current_employee.nil?
      flash[:alert] = t('error.sign_in')
      redirect_to root_path
    end
  end
end
