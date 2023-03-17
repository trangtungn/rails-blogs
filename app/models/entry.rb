class Entry < ApplicationRecord
  belongs_to :account
  belongs_to :entryable, polymorphic: true
end
