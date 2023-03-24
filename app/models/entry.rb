class Entry < ApplicationRecord
  delegated_type :entryable, types: %w(Article Comment Message), dependent: :destroy

  belongs_to :account
end
