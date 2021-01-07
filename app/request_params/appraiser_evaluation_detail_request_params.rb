# frozen_string_literal: true

class AppraiserEvaluationDetailRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :factor, :float
  attribute :appraiser_point, :integer
  
  def initialize(params)
    super(
      id: params[:id],
      factor: params[:factor],
      appraiser_point: params[:appraiser_point],
    )
  end
end
