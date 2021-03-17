puts "テストデータのインポート開始"
sample_user = User.where(email: "user1@example.com")
sample_category = Category.where(user_id: sample_user)
sample_task = Task.where(category_id: sample_category)

# User
20.times do |i|
  id = i + 1
  User.find_or_create_by!(email: "user#{id}@example.com") do |u|
    u.email = "user#{id}@example.com"
    u.password = "password"
    u.name = Faker::Name.name
  end
end
puts "ユーザーのテストデータを作成しました"

# Category
sample_user.each do |user|
  5.times do |i|
    num = i + 1
    user.categories.find_or_create_by!(name: "カテゴリー#{num}") do |c|
      c.name = "カテゴリー#{num}"
    end
  end
end
puts "カテゴリーを作成しました"

# Task
sample_category.each do |category|
  5.times do |i|
    num = i + 1
    category.tasks.find_or_create_by!(name: "タスク#{num}") do |t|
      t.name = "タスク#{num}"
    end
  end
end
puts "タスクを作成しました"

# Participation
sample_category.each do |category|
  category.participations.find_or_create_by!(user_id: 2) do |p|
    p.owner_id = category.user.id
    p.user_id = 2
  end
end
puts "共有者を追加しました"

# Comment
sample_task.each do |task|
  3.times do |i|
    num = i + 1
    task.comments.find_or_create_by!(content: "コメント#{num}") do |c|
      c.user_id = task.category.user.id
      c.content = "コメント#{num}"
    end
  end
end
puts "コメントを追加しました"

puts "テストデータのインポート終了"
