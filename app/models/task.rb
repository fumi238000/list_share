# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :category_id, presence: true
  belongs_to :category
  acts_as_list scope: :category
end
