module Visible
  extend ActiveSupport::Concern
  included do
    enum :status, active: 'active', inactive: 'inactive', archived: 'archived'
  end
end
