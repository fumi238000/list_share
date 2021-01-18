FactoryBot.define do
  factory :participation do
    association :user
    association :category

    sequence(:id, 1) { |n| "#{n}" }
    owner_id { 1 }
  end
end
