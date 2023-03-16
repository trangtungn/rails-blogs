FactoryBot.define do
  factory :comment do
    commenter { Faker::Name.name }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    article
    status { :pending }
  end
end
