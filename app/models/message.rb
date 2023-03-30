class Message < ApplicationRecord
  include Visible
  include Entryable

  validates :subject, presence: true, length: { maximum: 128 }

  def title
    subject
  end

  def content
    body
  end
end
