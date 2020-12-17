class Post < ApplicationRecord
  validates :user_id, uniqueness: true
  mount_uploader :image, ImageUploader      
end
