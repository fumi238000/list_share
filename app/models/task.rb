class Task < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true, length: { maximum: 30 }

  # has_many :comment, dependent: :destroy

  # has_many :check, dependent: :destroy, foreign_key: 'task_id'
  belongs_to :category

  #チェックボックス判定メソッド
  def checked_by?(t)
    Check.find_by(task_id: t.id).present?
  end


  #カテゴリー作成判定メソッド
  def current_user_create_category?
    binding.pry
    @category = Category.all
    @category = @category.where(user_id: current_user[:id]).present?
  end


end
