# frozen_string_literal: true

class MasterEvaluationPoint < ApplicationRecord
  has_one :evaluation_detail
end
