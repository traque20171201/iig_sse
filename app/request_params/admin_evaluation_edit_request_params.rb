# frozen_string_literal: true

class AdminEvaluationEditRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :manager_id, :integer
  attribute :appraiser_id, :integer
  attribute :status, :integer
    
  def initialize(params)
    super(
      id: params[:id],
      manager_id: params[:manager_id],
      appraiser_id: params[:appraiser_id],
      status: params[:status]
    )
  end
end
