# テストユーザー
NAME = "テスト"
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all

user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
user2 = User.create!(name: "鈴木", email: "suzuki@example.com", password: "password")

#同じカラムに複数のデータを入れたいので検討する
category1 = user1.category.create!(name: "朝ルーティン")
category1.task.create!(name: "水を飲む")
category1.task.create!(name: "シャワーを浴びる")
category1.task.create!(name: "瞑想する")


category2 = user2.category.create!(name: "朝ルーティン")
category2.task.create!(name: "水を飲む")


# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(name: NAME, email: EMAIL, password: PASSWORD)

puts "初期データの投入に成功しました！"
