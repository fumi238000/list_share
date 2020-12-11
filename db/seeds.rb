# テストユーザー
NAME = "テスト"
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all

#サンプルユーザー
user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
user2 = User.create!(name: "鈴木", email: "suzuki@example.com", password: "password")

#これ絶対にリファクタリングできるよ
user1.category.create!(name: "朝ルーティン")
user1.category.create!(name: "昼ルーティン")
user1.category.create!(name: "夜ルーティン")
user1.category.create!(name: "家事")

user2.category.create!(name: "散歩ルーティン")
user2.category.create!(name: "筋トレルーティン")
user2.category.create!(name: "ナイトルーティン")
user2.category.create!(name: "家事")



# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(name: NAME, email: EMAIL, password: PASSWORD)


puts "初期データの投入に成功しました！"
