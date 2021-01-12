FactoryBot.define do
  factory :category do
    association :user
    sequence(:id, 1) { |n| "#{n}" }
    name { Faker::Name.name }
  end
end
