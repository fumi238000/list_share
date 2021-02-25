# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:id, 1, &:to_s)
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }

    # 異常なパラメータ
    trait :invalid do
      id { nil }
      image { nil }
    end
  end
end

# factory :today do
# end
