# テストユーザー
NAME = "テスト"
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all

#サンプルユーザー
user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
user2 = User.create!(name: "鈴木", email: "suzuki@example.com", password: "password")
user3 = User.create!(name: "田中", email: "tanaka@example.com", password: "password")


user1.category.create!(name: "朝")
user1.category.create!(name: "昼")
user1.category.create!(name: "夜")
user1.category.create!(name: "家事")


# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(name: NAME, email: EMAIL, password: PASSWORD)


puts "初期データの投入に成功しました！"
