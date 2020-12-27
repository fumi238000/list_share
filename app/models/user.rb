class User < ApplicationRecord
  validates :name, presence: true
  
  has_many :category, dependent: :destroy, foreign_key: 'user_id'
  scope :category, -> { order(id: :desc)}

  has_many :check, dependent: :destroy, foreign_key: 'user_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader       

    def self.guest
      find_or_create_by!(name: "ゲストユーザー", email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
      end
    end
    
end