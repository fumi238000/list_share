class Participation < ApplicationRecord
  validates :owner_id, presence: true
  validates :participation_id, presence: true
  validates :category , presence: true  
end
