FactoryBot.define do
  factory :category do
    association :user
    sequence(:id, 1) { |n| "#{n}" }
    name { Faker::Name.name }
    user_id { 1 }
  end
end
