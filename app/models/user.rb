class User < ApplicationRecord
  has_many :category, dependent: :destroy, foreign_key: 'user_id'
  has_many :check, dependent: :destroy, foreign_key: 'user_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  def self.guest
    find_or_create_by!(name: "ゲストユーザー", email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end



end
