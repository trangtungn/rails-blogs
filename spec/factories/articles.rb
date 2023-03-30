FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { 'active' }
    lock_version { Faker::App.version }

    trait :invalid do
      title { '' }
      body { '' }
    end

    trait :invalid_length do
      title { Faker::Lorem.sentence(word_count: 129) }
      body { Faker::Lorem.characters(number: 7) }
    end
  end
end
