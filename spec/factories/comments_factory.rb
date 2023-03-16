FactoryBot.define do
  factory :comments do
    commenter { Faker::Name.name }
    content { Faker::Lorem.paragraph(sentence_count: 2) }
    article
    status { :pending }
  end
end
