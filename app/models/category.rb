class Category < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user

  validates :name, presence: true, length: { maximum: 20 }
  # validates :name, :uniqueness => {:scope => :user_id}

  has_many :tasks, dependent: :destroy
  scope :tasks, -> { order(position: :asc)}
  
  has_many :participation, dependent: :destroy

end

