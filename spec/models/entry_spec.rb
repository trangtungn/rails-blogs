require 'rails_helper'

RSpec.describe Entry, type: :model do
  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:entryable) }
end
