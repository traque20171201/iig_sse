# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  before_action :check_permission
  before_action :check_over_date_evaluation, only:[:edit, :save]

  def edit
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result

    return @result if @result[:evaluation].blank?

    if service.result[:evaluation]&.status_before_type_cast >= 4
      flash[:alert] = 'Cán bộ quản lý đã hoàn thành đánh giá. Không thể thay đổi đánh giá được nữa.'
      redirect_to employee_evaluations_path
    else
      @result
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

  def feedback
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    status = service.result[:evaluation].status_before_type_cast
    if [4, 7].include?(status)
      @result = service.result
    else
      flash[:alert] = 'Cán bộ quản lý chưa hoàn thành đánh giá nên chưa thể thực hiện phản hồi đánh giá.'
      redirect_to employee_evaluations_path
    end
  end

  def save_feedback
    request_params = EmployeeEvaluationFeedbackRequestParams.new(params)
    request_params.validate!
    service = EmployeeEvaluationFeedbackService.new(request_params)
    service.run!
    flash[:notice] = service.result
    redirect_to employee_evaluations_path
  end

  private

  def check_permission
    if current_employee.nil?
      flash[:alert] = t('error.sign_in')
      redirect_to root_path
    end
  end

  def check_over_date_evaluation
    # ignore_employees = [42, 138, 164]
    # return if ignore_employees.include?(current_employee.id)

    flash[:alert] = 'Đã hết thời hạn đánh giá. Bạn không thể đánh giá hoặc chỉnh sửa.'
    redirect_to employee_evaluations_path
  end
end
