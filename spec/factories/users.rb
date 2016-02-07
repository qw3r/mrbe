FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password 'secret'

    trait :admin do
      is_admin true
    end
  end
end
