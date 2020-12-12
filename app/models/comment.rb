class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 100 }

  belongs_to :task
end
