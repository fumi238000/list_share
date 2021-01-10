class Participation < ApplicationRecord
  validates :owner_id, presence: true
  validates :participation_id, presence: true ,numericality: {only_integer: true}
  validates :category, presence: true, uniqueness: { scope: :participation_id }

  # belongs_to :user, class_name: 'User', foreign_key: :owner_id
end