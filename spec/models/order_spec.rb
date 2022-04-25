require 'rails_helper'

describe Order do
  describe '#associations' do
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to belong_to(:shopper) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:amount) }
  end
end