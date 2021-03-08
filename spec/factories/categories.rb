# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    association :user, factory: :user
    name { Faker::JapaneseMedia::OnePiece.character }

    trait :invalid do
      name { nil }
    end
  end
end
