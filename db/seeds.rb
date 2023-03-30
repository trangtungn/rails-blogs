account = FactoryBot.create(:account)

article = FactoryBot.create(:article)
article_entry = FactoryBot.create(:article_entry, account:, entryable: article)
article_entry2 = FactoryBot.create(:article_entry, :article)

comment = FactoryBot.create(:comment)
comment_entry = FactoryBot.create(:comment_entry, account:, entryable: comment)

message = FactoryBot.create(:message)
message_entry = FactoryBot.create(:message_entry, account:, entryable: message)

task = FactoryBot.create(:task)
task_of_account = FactoryBot.create(:task, account:)
