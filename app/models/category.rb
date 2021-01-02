class Category < ApplicationRecord
  #バリデーション（空文字、文字数制限20文字まで）
  validates :name, presence: true, length: { maximum: 20 }

  has_many :tasks, dependent: :destroy
  scope :tasks, -> { order(position: :asc)}
  
  belongs_to :user
  acts_as_list scope: :user

end
