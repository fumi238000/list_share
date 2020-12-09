class Category < ApplicationRecord
  #空文字、文字数制限20文字まで
  validates :name, presence: true, length: { maximum: 20 }

  belongs_to :user
end
