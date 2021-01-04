FactoryBot.define do
  factory :task do
    association :category
    id { 1 }
    category_id { 1 }
    name { Faker::Name.name }
  end
end
