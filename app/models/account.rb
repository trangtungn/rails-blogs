class Account < ApplicationRecord
  has_many :entries

  validates :email, presence: true
  validates :username, presence: true
end
