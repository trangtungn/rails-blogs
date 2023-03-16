FactoryBot.define do
  factory :articles do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { :active }
  end
end
