class AgentProfile < ApplicationRecord
  belongs_to :account
  belongs_to :profileable, polymorphic: true
end
