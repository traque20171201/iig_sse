# frozen_string_literal: true

class ManagerEvaluationDetailRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :factor, :float
  attribute :manager_point, :integer
  attribute :manager_comment, :string

  def initialize(params)
    super(
      id: params[:id],
      factor: params[:factor],
      manager_point: params[:manager_point],
      manager_comment: params[:manager_comment]
    )
  end
end
