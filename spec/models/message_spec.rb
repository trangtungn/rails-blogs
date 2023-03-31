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

  describe "#title" do
    let(:subject) { Faker::Lorem.sentence(word_count: 10) }
    let(:message) { create(:message, subject:) }

    before { message }

    it { expect(message.title).to eq(subject) }
  end

  describe "#content" do
    let(:body) { Faker::Lorem.paragraph(sentence_count: 2) }
    let(:message) { create(:message, body:) }

    before { message }

    it { expect(message.content).to eq(body) }
  end
end
