FactoryBot.define do
  factory :comment do
    article
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    status { 'pending' }
  end
end
