FactoryBot.define do
  factory :task do
    description { Faker::Lorem.sentence(word_count: 5) }
    completed { false }

    trait :completed do
      completed { true }
    end
  end
end
