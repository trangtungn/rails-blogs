FactoryBot.define do
  factory :account do
    email { Faker::Internet.email(domain: 'example.com') }
    username { Faker::Internet.username }
    status { 'active' }

    trait :invalid do
      email { '' }
    end

    trait :invalid_status do
      status { 'abc' }
    end
  end
end
