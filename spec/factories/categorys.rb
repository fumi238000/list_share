FactoryBot.define do
  factory :category do
    association :user
    name { Faker::Name.name }
    user_id { 1 }
    id { 1 }
  end
end
