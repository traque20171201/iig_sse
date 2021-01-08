# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :check_permission_before

  def list_employees
    @employees = Employee.includes(:department).order("registration_date ASC").all
  end

  def list_evaluations
    @evaluations = Evaluation.includes(employee: [:department]).order("status, id ASC").all
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
