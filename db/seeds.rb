# テストユーザー
NAME = "テスト"
EMAIL = "test@example.com"
PASSWORD = "password"

# データを全削除
User.destroy_all

#同じカラムに複数のデータを入れたいので検討する

#原型------------------------
user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
category1 = user1.category.create!(name: "朝ルーティン")
category1.task.create!(name: "水を飲む")

#--------------------------


# user1 = User.create!(name: "佐藤", email: "satou@example.com", password: "password")
# category1 = user1.category.create!(name: "朝ルーティン")
# task1 = category1.task.create!(name: "水を飲む")
# task1.comment.create!(content: "水を飲む時、たくさん飲み過ぎないこと")



#サブユーザー２
user2 = User.create!(name: "鈴木", email: "suzuki@example.com", password: "password")
category2 = user2.category.create!(name: "朝ルーティン")
category2.task.create!(name: "水を飲む")


# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(name: NAME, email: EMAIL, password: PASSWORD)

puts "初期データの投入に成功しました！"
