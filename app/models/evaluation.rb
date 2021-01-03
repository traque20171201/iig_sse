# frozen_string_literal: true

class Evaluation < ApplicationRecord
  belongs_to :employee
  has_many :evaluation_details
end
