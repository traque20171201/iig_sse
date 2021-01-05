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
    # evaluation = Evaluation.find(params[:id])
    # evaluation.update!(
    #   achievements: params[:achievements],
    #   achievements: params[:positive_goals],
    #   achievements: params[:negative_goals],
    #   achievements: params[:overall_comments],
    # )
    # params[:evaluation_details].values.each do |evaluation_detail|
    #   detail = EvaluationDetail.find(evaluation_detail[:id])
    #   detail.update!(
    #     employee_point: evaluation_detail[:employee_point],
    #     employee_comment: evaluation_detail[:employee_comment],
    #     manager_point: evaluation_detail[:manager_point],
    #     manager_comment: evaluation_detail[:manager_comment],
    #     appraiser_point: evaluation_detail[:appraiser_point]
    #   )
    # end
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
