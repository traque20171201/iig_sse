# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :employees

  scope :where_by_id, ->(id) { where(id: id) if id.present? }
end
