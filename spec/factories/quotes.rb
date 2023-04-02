FactoryBot.define do
  factory :quote do
    name { Faker::Lorem.paragraphs(number: 1) }
  end
end
