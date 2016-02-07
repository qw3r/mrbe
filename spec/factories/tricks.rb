FactoryGirl.define do
  factory :trick do
    dog

    name { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
  end
end
