FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    # user_id { 1 }
    association :task, factory: :task
    content { Faker::Sports::Football.player }

    trait :invalid do
      content { nil }
    end
  end
end
