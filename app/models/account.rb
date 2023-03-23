class Account < ApplicationRecord
  enum status: {
    active: 'active',
    inactive: 'inactive',
  }

  has_many :entries

  validates :email, presence: true
  validates :username, presence: true
  validates :status, presence: true
end
