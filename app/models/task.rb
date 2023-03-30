class Task < ApplicationRecord
  belongs_to :account

  validates :description, presence: true, length: { maximum: 200 }
end
