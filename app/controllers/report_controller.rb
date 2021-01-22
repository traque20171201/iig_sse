# frozen_string_literal: true

class ReportController < ApplicationController
  before_action :check_permission_before

  def list_evaluations
    @status = params[:status]
    @department_id = params[:department]
    @departments = Department.all

    @evaluations = Evaluation.includes(employee: [:department])
                            .where_by_status(params[:status])
                            .where_by_department_id(params[:department])
                            .order("status, id ASC").page params[:page]
  end

  def show_evaluation
    request_params = GetEvaluationRequestParams.new(params[:employee_id])
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @result = service.result
  end

  def result_evaluations
    @status = params[:status]
    @department_id = params[:department]
    @departments = Department.all

    @evaluations = Evaluation.includes(employee: [:department])
                            .where_by_status(params[:status])
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
      if !current_employee.ceo?
        flash[:alert] = t('error.permission')
        redirect_to root_path
      end
    end
  end
end