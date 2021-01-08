# frozen_string_literal: true

class ManagerEvaluationRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :employee_id, :integer
  attribute :evaluation_details
  attribute :achievements_manager, :string
  attribute :positive_goals_manager, :string
  attribute :negative_goals_manager, :string
  attribute :overall_comments_manager, :string
  attribute :result, :integer
  attribute :save, :string
  
  def initialize(params)
    super(
      id: params[:id],
      employee_id: params[:employee_id],
      evaluation_details: params[:evaluation_details].values.each_with_object([]) do |evaluation_detail, arr|
        arr << ManagerEvaluationDetailRequestParams.new(evaluation_detail)
      end,
      achievements_manager: params[:achievements_manager],
      positive_goals_manager: params[:positive_goals_manager],
      negative_goals_manager: params[:negative_goals_manager],
      overall_comments_manager: params[:overall_comments_manager],
      result: params[:result],
      save: params[:save],
    )
  end

  def validate!
    super
  end
end
