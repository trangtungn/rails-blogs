class Entry < ApplicationRecord
  # shared logic
  # include Eventable, Forwardable, Redeliverable

  delegated_type :entryable, types: Entryable::TYPES, dependent: :destroy
  accepts_nested_attributes_for :entryable

  delegate :title, to: :entryable
  delegate :content, to: :entryable

  belongs_to :account

  scope :with_entryables, -> { includes(:entryable) }

  def self.create_with_comment(content, creator: Current.user)
    create! entryable: Comment.new(content: content), creator: creator
  end
end
