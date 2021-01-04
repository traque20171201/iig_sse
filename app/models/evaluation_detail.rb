# frozen_string_literal: true

class EvaluationDetail < ApplicationRecord
  belongs_to :evaluation

  def master_evaluation_point
    MasterEvaluationPoint.find(evaluation_point_id)
  end
end
