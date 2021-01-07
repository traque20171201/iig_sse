# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  def edit
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    if service.result[:evaluation].status_before_type_cast >= 2
      flash[:alert] = 'Đã hoàn thành đánh giá. Không thể thực hiện đánh giá lại nữa.'
      redirect_to employee_evaluations_path 
    else
      @result = service.result
    end
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
