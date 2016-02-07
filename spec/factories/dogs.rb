FactoryGirl.define do
  factory :dog do
    user

    name { Faker::Name.first_name }
    breed { Faker::Team.creature }
  end
end
