FactoryBot.define do
  factory :participation do
    # association :user
    # association :category

    owner_id { 1 }            #user_id
    participation_id { 2 }    #user_id
    category { 1 }
  end
end
