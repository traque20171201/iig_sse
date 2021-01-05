# frozen_string_literal: true

class ManagerEvaluationRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :employee_id, :integer
  attribute :evaluation_details
  attribute :achievements, :string
  attribute :positive_goals, :string
  attribute :negative_goals, :string
  attribute :overall_comments, :string
  attribute :one_one_date, :date
  attribute :employee_comments, :string
  attribute :is_agree, :boolean
  attribute :save, :string
  
  def initialize(params)
    super(
      id: params[:id],
      employee_id: params[:employee_id],
      evaluation_details: params[:evaluation_details].values.each_with_object([]) do |evaluation_detail, arr|
        arr << ManagerEvaluationDetailRequestParams.new(evaluation_detail)
      end,
      achievements: params[:achievements],
      positive_goals: params[:positive_goals],
      negative_goals: params[:negative_goals],
      overall_comments: params[:overall_comments],
      one_one_date: params[:one_one_date],
      employee_comments: params[:employee_comments],
      is_agree: params[:is_agree],
      save: params[:save],
    )
  end

  def validate!
    super
  end
end
