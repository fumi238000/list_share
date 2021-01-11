class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :categorys, dependent: :destroy, foreign_key: 'user_id'
  scope :categorys, -> { order(position: :asc)}
  
  has_many :check, dependent: :destroy, foreign_key: 'user_id'
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  has_many :participations
  mount_uploader :image, ImageUploader       

    def self.guest
      find_or_create_by!(name: "ゲストユーザー", email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
      end
    end
    
end