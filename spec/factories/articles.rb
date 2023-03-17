FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(number: 1) }
    status { :active }
    lock_version { Faker::App.version }
  end
end
