# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :category
    sequence(:id, 1, &:to_s)
    category_id { 1 }
    name { 'コメントを追加' }

    trait :invalid do
      name { nil }
    end
  end
end
