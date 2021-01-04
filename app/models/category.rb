class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :tasks, dependent: :destroy
  scope :tasks, -> { order(position: :asc)}
  
  belongs_to :user
  acts_as_list scope: :user

end

