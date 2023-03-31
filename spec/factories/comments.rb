FactoryBot.define do
  factory :comment do
    article
    commenter { Faker::Name.name }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    status { 'pending' }
  end
end
