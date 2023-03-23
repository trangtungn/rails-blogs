require 'rails_helper'

RSpec.describe Account, type: :model do
  # subject { described_class.new(attributes_for(:account)) }

  it { is_expected.to have_many(:entries) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_inclusion_of(:status).in_array(['active', 'inactive']) }

  it { is_expected.to define_enum_for(:status).with_values(%w(active inactive)) }

  it { expect(build(:account)).to be_valid }
  it { expect(build(:account, :invalid)).not_to be_valid }
end
