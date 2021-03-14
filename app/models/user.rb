class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :categories, dependent: :destroy
  has_many :check, dependent: :destroy
  has_many :participations

  scope :categories, -> { order(position: :asc) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
