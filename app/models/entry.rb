class Entry < ApplicationRecord
  # shared logic
  # include Eventable, Forwardable, Redeliverable

  delegated_type :entryable, types: %w(Article Comment Message), dependent: :destroy
  accepts_nested_attributes_for :entryable

  delegate :title, to: :entryable
  delegate :content, to: :entryable

  belongs_to :account

  def self.create_with_comment(content, creator: Current.user)
    create! entryable: Comment.new(content: content), creator: creator
  end
end
