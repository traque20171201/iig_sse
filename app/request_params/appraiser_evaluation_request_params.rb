# frozen_string_literal: true

class AppraiserEvaluationRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :employee_id, :integer
  attribute :evaluation_details
  attribute :save, :string
  
  def initialize(params)
    super(
      id: params[:id],
      employee_id: params[:employee_id],
      evaluation_details: params[:evaluation_details].values.each_with_object([]) do |evaluation_detail, arr|
        arr << AppraiserEvaluationDetailRequestParams.new(evaluation_detail)
      end,
      save: params[:save],
    )
  end

  def validate!
    super
  end
end
 