require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to have_many(:entries) }
  it { is_expected.to have_many(:tasks) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:status) }

  it {
    is_expected.to define_enum_for(:status).
      with_values(active: 'active', inactive: 'inactive').
      backed_by_column_of_type(:string)
  }

  it { expect(build(:account)).to be_valid }
  it { expect(build(:account, :invalid)).not_to be_valid }
end
