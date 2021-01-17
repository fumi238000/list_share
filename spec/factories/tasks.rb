FactoryBot.define do
  factory :task do
    association :category
    sequence(:id, 1) { |n| "#{n}" }
    category_id { 1 }
    name { Faker::Job.title }
  end
end
