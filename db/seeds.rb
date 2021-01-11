# テストユーザー
NAME = "テスト"
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all
Category.destroy_all
Task.destroy_all

user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
user2 = User.create!(name: "山田", email: "yamada@example.com", password: "password")
user3 = User.create!(name: "鈴木", email: "suzuki@example.com", password: "password")


Category.create!(name:"朝ルーティン", user_id: user1.id)

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(name: NAME, email: EMAIL, password: PASSWORD)

puts "初期データの投入に成功しました！"
