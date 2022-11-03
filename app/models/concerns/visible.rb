module Visible
  extend ActiveSupport::Concern
  included do
    enum :status, archived: 'archived', active: 'active', inactive: 'inactive'
  end
end
