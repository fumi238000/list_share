class Task < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true, length: { maximum: 30 }
  belongs_to :category
  acts_as_list scope: :category
end
