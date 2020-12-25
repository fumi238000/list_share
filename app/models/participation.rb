class Participation < ApplicationRecord
  validates :owner_id, presence: true
  validates :participation_id, presence: true
  validates :category, presence: true, uniqueness: { scope: :participation_id }
end