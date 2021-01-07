# frozen_string_literal: true

class EvaluationDetail < ApplicationRecord
  belongs_to :evaluation
  belongs_to :master_evaluation_point, foreign_key: 'evaluation_point_id'
end
