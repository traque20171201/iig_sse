# frozen_string_literal: true

class EmployeeEvaluationFeedbackRequestParams < RequestParamsBase
  attribute :id, :integer
  attribute :one_one_date, :date
  attribute :is_agree, :boolean
  attribute :employee_comments, :string
  attribute :save, :string

  def initialize(params)
    super(
      id: params[:id],
      one_one_date: params[:one_one_date],
      is_agree: params[:is_agree],
      employee_comments: params[:employee_comments],
      save: params[:save]
    )
  end
end
