FactoryBot.define do
  factory :message do
    account

    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { :active }
  end
end
