class Message < ApplicationRecord
  include Visible
  include Entryable

  belongs_to :account

  validates :subject, presence: true, length: { maximum: 128 }
end
