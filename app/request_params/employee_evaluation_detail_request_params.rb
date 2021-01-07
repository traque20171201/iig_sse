# frozen_string_literal: true

class EmployeeEvaluationDetailRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :factor, :float
  attribute :employee_point, :integer
  attribute :employee_comment, :string

  def initialize(params)
    super(
      id: params[:id],
      factor: params[:factor],
      employee_point: params[:employee_point],
      employee_comment: params[:employee_comment]
    )
  end
end
