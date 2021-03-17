class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  # validates :name, :uniqueness => {:scope => :user_id}
  
  belongs_to :user
  acts_as_list scope: :user
  
  has_many :tasks, dependent: :destroy
  scope :tasks, -> { order(position: :asc) }

  has_many :participations, dependent: :destroy
end
