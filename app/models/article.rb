class Article < ApplicationRecord
  include Visible
  include Entryable

  belongs_to :account
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 128 }
  validates :body, presence: true, length: { minimum: 10 }
end
