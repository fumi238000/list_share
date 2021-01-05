FactoryBot.define do
  factory :user do
    sequence(:id, 1) { |n| "#{n}" }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" } 
  end
end