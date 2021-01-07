# frozen_string_literal: true

class GetEvaluationRequestParams < RequestParamsBase
  attribute :employee_id, :integer

  validates :employee_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def initialize(employee_id)
    super(employee_id: employee_id)
  end
end
  