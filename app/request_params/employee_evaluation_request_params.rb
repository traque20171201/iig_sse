# frozen_string_literal: true

class EmployeeEvaluationRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :evaluation_details
  attribute :achievements, :string
  attribute :positive_goals, :string
  attribute :negative_goals, :string
  attribute :overall_comments, :string
  attribute :save, :string

  def initialize(params)
    super(
      id: params[:id],
      evaluation_details: params[:evaluation_details].values.each_with_object([]) do |evaluation_detail, arr|
        arr << EmployeeEvaluationDetailRequestParams.new(evaluation_detail)
      end,
      achievements: params[:achievements],
      positive_goals: params[:positive_goals],
      negative_goals: params[:negative_goals],
      overall_comments: params[:overall_comments],
      save: params[:save],
    )
  end
end
