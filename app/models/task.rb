class Task < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true, length: { maximum: 30 }

  # has_many :comment, dependent: :destroy

  # has_many :check, dependent: :destroy, foreign_key: 'task_id'
  belongs_to :category

  #チェックボックス判定メソッド
  def checked_by?(user)
    Check.find_by(user_id: user.id).present?
  end
end
