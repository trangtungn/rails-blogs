FactoryBot.define do
  factory :message do
    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { :active }
  end
end
