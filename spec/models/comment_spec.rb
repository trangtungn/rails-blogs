require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:article) }
  it { is_expected.to have_one(:entry) }

  it {
    is_expected.to define_enum_for(:status).
      with_values(active: 'active', inactive: 'inactive', archived: 'archived', pending: 'pending').
      backed_by_column_of_type(:string)
  }
end
