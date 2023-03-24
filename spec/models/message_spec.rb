require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to have_one(:entry) }

  it {
    is_expected.to define_enum_for(:status).
      with_values(active: 'active', inactive: 'inactive', archived: 'archived', pending: 'pending').
      backed_by_column_of_type(:string)
  }

  it { expect(build(:message)).to be_valid }
  it { expect(build(:message, :invalid)).not_to be_valid }
  it { expect(build(:message, :invalid_length)).not_to be_valid }
end
