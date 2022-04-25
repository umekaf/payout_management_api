require 'rails_helper'

describe MerchantDisbursement do
  describe '#associations' do
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to belong_to(:order) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:disburse_amount) }
  end
end
