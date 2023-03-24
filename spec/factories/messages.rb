FactoryBot.define do
  factory :message do
    subject { Faker::Lorem.sentence(word_count: 5) }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { 'active' }

    trait :invalid do
      subject { '' }
    end

    trait :invalid_length do
      subject { Faker::Lorem.characters(number: 129) }
    end
  end
end
