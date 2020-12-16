class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :user_id, uniqueness: true

end
