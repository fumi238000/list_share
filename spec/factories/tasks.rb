# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :category, factory: :category
    name { 'コメントを追加' }

    trait :invalid do
      name { nil }
    end
  end
end
