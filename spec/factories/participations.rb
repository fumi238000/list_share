# frozen_string_literal: true

FactoryBot.define do
  factory :participation do
    association :user
    association :category

    sequence(:id, 1, &:to_s)
    owner_id { 1 }
    user_id { 1 }
    category_id { 1 }

    trait :invalid do
      user_id { nil }
    end
  end
end
