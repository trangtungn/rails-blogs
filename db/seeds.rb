account = FactoryBot.create(:account)

article = FactoryBot.create(:article)
article_entry = FactoryBot.create(:article_entry, account:, entryable: article)
article_entry2 = FactoryBot.create(:article_entry, :article)

comment = FactoryBot.create(:comment)
comment_entry = FactoryBot.create(:comment_entry, account:, entryable: comment)

message = FactoryBot.create(:message)
message_entry = FactoryBot.create(:message_entry, account:, entryable: message)

# create entry using Nested Attributes
params = { entry: { entryable_type: 'Message', entryable_attributes: { subject: 'Smiling' } } }
message_entry_with_nested_subject = Entry.create(params[:entry])
message_entry_with_nested_subject.entryable.id # => 2
message_entry_with_nested_subject.entryable.subject # => 'Smiling'

task = FactoryBot.create(:task)
task_of_account = FactoryBot.create(:task, account:)
