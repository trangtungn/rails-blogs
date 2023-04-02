require 'rails_helper'

RSpec.describe Quote, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { expect(build(:quote)).to be_valid }
end
