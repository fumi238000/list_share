FactoryBot.define do
  factory :task do
    association :category
    category_id { 1 }
    name { Faker::Name.name }
    # id { rand(256)}
  end
end
