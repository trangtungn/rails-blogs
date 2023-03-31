account = FactoryBot.create(:account, :signin)

article = FactoryBot.create(:article)
FactoryBot.create(:article_entry, account:, entryable: article)

comment = FactoryBot.create(:comment, article:)
FactoryBot.create(:comment_entry, account:, entryable: comment)

message = FactoryBot.create(:message)
FactoryBot.create(:message_entry, account:, entryable: message)

# create entry using Nested Attributes
params = {
  entry: {
    entryable_type: 'Message',
    entryable_attributes: { subject: 'Smiling' }, account:,
  },
}
message_entry_with_nested_subject = Entry.create!(params[:entry])
p message_entry_with_nested_subject.entryable.id # => 2
p message_entry_with_nested_subject.entryable.subject # => 'Smiling'

FactoryBot.create(:task, account:)
