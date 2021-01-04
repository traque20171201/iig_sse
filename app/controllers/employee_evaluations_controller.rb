# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  def edit
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
    @evaluation = Evaluation.new
    @evaluation_details = @result[:evaluation].evaluation_details
  end

  def draff
    flash[:alert] = 'Nguyễn Hữu Thịnh.'
    redirect_to root_path
  end

  def save
    flash[:notice] = 'Nguyễn Đặng Trà Quế.'
    redirect_to root_path
  end

  def show
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end
end
