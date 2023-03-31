FactoryBot.define do
  factory :account do
    email { Faker::Internet.email(domain: 'example.com') }
    username { Faker::Internet.username }
    status { 'active' }

    trait :signin do
      username { Account.default_username }
    end

    trait :invalid do
      email { '' }
    end
  end
end
