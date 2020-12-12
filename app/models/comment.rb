class Comment < ApplicationRecord

  # 多分ここは違う？
  # belongs_to :user

  
  belongs_to :task
end
