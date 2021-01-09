# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :check_permission_before

  def list_employees
    @department_id = params[:department]
    @departments = Department.all

    @employees = Employee.includes(:department)
                          .where_by_department_id(params[:department])
                          .order("registration_date ASC").page params[:page]
  end

  def list_evaluations
    @status = params[:status]
    @department_id = params[:department]
    @departments = Department.all

    @evaluations = Evaluation.includes(employee: [:department])
                            .where_by_status(params[:status])
                            .where_by_department_id(params[:department])
                            .order("status, id ASC").page params[:page]
  end

  def edit_evaluation
    @evaluation = Evaluation.preload(employee: [:department]).find(params[:evaluation_id])
    @managers = Employee.where("role > 0")

    @manager_id = @evaluation.manager_id
    @appraiser_id = @evaluation.appraiser_id
    @status = @evaluation.status_before_type_cast
  end

  def save_evaluation
    request_params = AdminEvaluationEditRequestParams.new(params)
    request_params.validate!
    service = AdminEvaluationEditService.new(request_params)
    service.run!
    flash[:notice] = service.result
    redirect_to admin_evaluations_list_path
  end

  def reset_password
    employee = Employee.find(params[:employee_id])

    employee.update!(
      encrypted_password: '$2a$11$tDzf6sfGMaIKLDsasU9P1eLiSm/DZ5heyiMbWFIVBWEG6zKB.JfBi'
    )

    flash[:notice] = t('reset_password_success', username: employee.name)
    redirect_to admin_employees_list_path
  end

  def check_permission_before
    if current_employee.nil?
      flash[:alert] = t('error.sign_in')
      redirect_to root_path
    else
      if !current_employee.admin?
        flash[:alert] = t('error.permission')
        redirect_to root_path
      end
    end
  end
end