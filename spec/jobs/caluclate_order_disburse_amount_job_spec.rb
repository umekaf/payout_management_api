require 'rails_helper'

describe CaluclateOrderDisburseAmountJob do
  include ActiveJob::TestHelper

  it_behaves_like 'an application job'

  describe '#perform' do
    subject(:trigger_job) do
      described_class.perform_now(order.id)
    end
    let(:order) {create(:order, :completed)}

    let(:disbursement_calculator_instance) do
      instance_double(
        DisbursementCalculator,
        call: true
      )
    end

    it 'calls ' do
      allow(DisbursementCalculator).to(
        receive(:new).with(order.id).and_return(disbursement_calculator_instance)
      )

      expect(trigger_job).to eq(true)
    end
  end
end