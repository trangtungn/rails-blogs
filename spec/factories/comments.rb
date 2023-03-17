FactoryBot.define do
  factory :comment do
    account
    article
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    status { :pending }
  end
end
