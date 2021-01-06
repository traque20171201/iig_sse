# frozen_string_literal: true

class AppraiserEvaluationsController < ApplicationController  
  def list
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationsForAppraiserService.new(request_params)
    service.run!
    @evaluations = service.result
  end

  def edit
    request_params = GetEvaluationRequestParams.new(params[:employee_id])
    request_params.validate!
    if !check_permission(current_employee.id, request_params.employee_id)
      flash[:alert] = 'Không có quyền truy cập.'
      redirect_to root_path
    end
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    if service.result[:evaluation].status_before_type_cast >= 6
      flash[:alert] = 'Đã hoàn thành thẩm định. Không thể thực hiện thẩm định lại nữa.'
      redirect_to appraiser_evaluations_path(employee_id: request_params.employee_id)
    else
      @result = service.result
    end
  end

  def save
    request_params = AppraiserEvaluationRequestParams.new(params)
    # request_params.validate!
    if !check_permission(current_employee.id, request_params.employee_id)
      flash[:alert] = 'Không có quyền truy cập.'
      redirect_to root_path
    end
    service = AppraiserEvaluationService.new(request_params)
    service.run!
    flash[:notice] = service.result
    redirect_to appraiser_evaluations_path(employee_id: request_params.employee_id)
  end

  def show
    request_params = GetEvaluationRequestParams.new(params[:employee_id])
    # request_params.validate!
    if !check_permission(current_employee.id, request_params.employee_id)
      flash[:alert] = 'Không có quyền truy cập.'
      redirect_to root_path
    end
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end

  private

  def check_permission(current_employee_id, employee_id)
    Evaluation.exists?(:appraiser_id => current_employee_id, :employee_id => employee_id)
  end
end
  