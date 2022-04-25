require 'rails_helper'

describe DisbursementCalculator do
  describe '#call' do
    subject {described_class.new(order.id)}

    let(:order) {create(:order, :completed, amount: 42.55)}

    it 'returns the disburse amount by deducting one percent of the order amount' do
      expect { subject.call }.to change(MerchantDisbursement, :count).by(1)
    end
  end
end
