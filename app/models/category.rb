class Category < ApplicationRecord
  #バリデーション（空文字、文字数制限20文字まで）
  validates :name, presence: true, length: { maximum: 20 }

  has_many :tasks, dependent: :destroy
  
  belongs_to :user
  acts_as_list scope: :user

end
