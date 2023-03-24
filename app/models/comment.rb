class Comment < ApplicationRecord
  include Visible
  include Entryable

  belongs_to :article
  belongs_to :account
end
