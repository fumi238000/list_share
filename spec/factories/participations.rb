FactoryBot.define do
  factory :participation do
    association :user
    association :category

    sequence(:id, 1) { |n| "#{n}" }
    owner_id { 1 }
    user_id { 1 }  
    category_id { 1 }
    
    
    trait :invalid do
      category_id { nil }
    end
    
  end
end
