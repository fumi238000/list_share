FactoryBot.define do
  factory :comment do
    association :user
    association :task
    user_id { 1 }
    task_id { 1 }
    content { Faker::Sports::Football.player }

    trait :invalid do
      content { nil }
    end
  end
end
