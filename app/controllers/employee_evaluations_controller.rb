# frozen_string_literal: true

class EmployeeEvaluationsController < ApplicationController
  def edit
    request_params = GetEvaluationRequestParams.new(current_employee.id)
    request_params.validate!
    service = GetEvaluationByEmployeeIdService.new(request_params)
    service.run!
    @evaluation = service.result
  end

  def save
  end

  def show
  end
end
