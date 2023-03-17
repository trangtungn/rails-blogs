class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 128 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :status, presence: true, inclusion: { in: statuses, message: "%{value} is not valid" }
end
