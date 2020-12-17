class Post < ApplicationRecord

  validates :user_id, uniqueness: true

end
