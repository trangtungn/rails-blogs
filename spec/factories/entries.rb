FactoryBot.define do
  factory :entry, aliases: [:article_entry, :comment_entry, :message_entry] do
    account
    status { 'active' }

    trait :article do
      entryable factory: :article
    end

    trait :comment do
      entryable factory: :comment
    end

    trait :message do
      entryable factory: :message
    end
  end
end
