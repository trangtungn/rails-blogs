class Comment < ApplicationRecord
  include Visible
  include Entryable

  belongs_to :article

  def title
    content.truncate(128)
  end
end
