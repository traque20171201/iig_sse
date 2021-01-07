# frozen_string_literal: true

class ManagerEvaluationDetailRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :factor, :float
  attribute :employee_point, :integer
  attribute :employee_comment, :string
  attribute :manager_point, :integer
  attribute :manager_comment, :string

  def initialize(params)
    super(
      id: params[:id],
      factor: params[:factor],
      employee_point: params[:employee_point],
      employee_comment: params[:employee_comment],
      manager_point: params[:manager_point],
      manager_comment: params[:manager_comment]
    )
  end
end
