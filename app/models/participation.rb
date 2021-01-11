class Participation < ApplicationRecord
  validates :owner_id, presence: true
  validates :user_id, presence: true 
  validates :category, presence: true, uniqueness: { scope: :user_id }


  #  validates :participation_id, presence: true ,numericality: {only_integer: true}
  # validates :category, presence: true, uniqueness: { scope: :participation_id }
  belongs_to :user
  belongs_to :category

end