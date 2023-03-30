require 'rails_helper'

RSpec.describe Article, type: :model do
  it { is_expected.to have_one(:entry) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(128) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(10) }

  it {
    is_expected.to define_enum_for(:status).
      with_values(active: 'active', inactive: 'inactive', archived: 'archived', pending: 'pending').
      backed_by_column_of_type(:string)
  }

  it { expect(build(:article)).to be_valid }
  it { expect(build(:article, :invalid)).not_to be_valid }
  it { expect(build(:article, :invalid_length)).not_to be_valid }
end
