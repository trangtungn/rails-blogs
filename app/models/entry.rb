class Entry < ApplicationRecord
  delegated_type :entryable, types: %w(Article Comment Message), dependent: :destroy
  delegate :title, to: :entryable
  delegate :content, to: :entryable

  belongs_to :account

  def self.create_with_comment(content, creator: Current.user)
    create! entryable: Comment.new(content: content), creator: creator
  end
end
