class Comment < ApplicationRecord
  include Visible
  include Entryable

  belongs_to :article

  validates :commenter, presence: true

  def title
    content&.truncate(128)
  end
end
