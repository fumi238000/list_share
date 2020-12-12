class Task < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true, length: { maximum: 30 }

  # has_many :comment, dependent: :destroy

  belongs_to :category
end
