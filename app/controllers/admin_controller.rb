# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :check_permission_before
  skip_before_action :verify_authenticity_token, only:[:change_role]

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

  def change_role
    employee = Employee.find(params[:employee_id])

    employee.update!(
      role: params[:role].to_i
    )

    flash[:notice] = t('change_role_success', username: employee.name)
    redirect_to admin_employees_list_path
  end

  def show_evaluation
    request_params = GetEvaluationRequestParams.new(params[:employee_id])
    # request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end

  def result_evaluations
    @department_id = params[:department]
    @departments = Department.all

    @evaluations = Evaluation.includes(employee: [:department])
                            .where_by_department_id(params[:department])
                            .order("status, id ASC").page params[:page]
  end

  def export_evaluations
    @department_id = params[:department]

    @evaluations = Evaluation.includes(employee: [:department])
                              .where_by_department_id(params[:department])
                              .order("status, id ASC")

    filename = "Danh sách kết quả đánh giá toàn bộ công ty năm 2020.xlsx"
    filename = "Danh sách kết quả đánh giá phòng #{Department.find(params[:department]).name} năm 2020.xlsx" if params[:department].present?

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=#{filename}"
      }
    end
  end

  private 

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
