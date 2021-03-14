class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :category_id, presence: true

  belongs_to :category
  has_many :comments, dependent: :destroy

  acts_as_list scope: :category
end
