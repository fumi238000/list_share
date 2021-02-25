# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    association :user
    sequence(:id, 1, &:to_s)
    sequence(:user_id, 1, &:to_s)
    name { Faker::JapaneseMedia::OnePiece.character }

    trait :invalid do
      name { nil }
    end
  end
end
