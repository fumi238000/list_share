FactoryBot.define do
  factory :category do
    association :user
    sequence(:id, 1) { |n| "#{n}" }
    sequence(:user_id, 1) { |n| "#{n}" }
    name { Faker::JapaneseMedia::OnePiece.character }
    
    trait :invalid do
      name { nil }
    end
  end
end
