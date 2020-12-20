class User < ApplicationRecord
  has_many :category, dependent: :destroy, foreign_key: 'user_id'
  has_many :check, dependent: :destroy, foreign_key: 'user_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader       

    def self.guest
      find_or_create_by!(id:1000, name: "ゲストユーザー", email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
      end
    end

end