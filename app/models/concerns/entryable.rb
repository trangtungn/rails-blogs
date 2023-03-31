module Entryable
  extend ActiveSupport::Concern

  TYPES = %w(Article Comment Message).freeze

  included do
    has_one :entry, as: :entryable, touch: true
  end
end
