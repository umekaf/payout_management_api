require 'rails_helper'

describe Order do
  describe '#associations' do
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to belong_to(:shopper) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe '#callbacks' do
    describe '#completed?' do
      context 'when order is completed' do
        let(:order) {create(:order, :completed)}

        it 'return true as completed_at is changed from nil to date' do
          expect(order.completed_at_before_last_save).not_to eq(order.completed_at)
          expect(order.send(:completed?)).to be_truthy
        end
      end

      context 'when order is not completed' do
        let(:order) {create(:order)}

        it 'returns false as the completed at is still nil' do
          expect(order.completed_at_before_last_save).to eq(order.completed_at)
          expect(order.send(:completed?)).to be_falsey
        end
      end
    end

    describe "#calculate_disbursement_amount_for_completed_order" do
      context 'when completed_at change from nil to some date' do
        let(:order) { build(:order, :completed) }

        it 'enqueue CaluclateOrderDisburseAmountJob with order_id' do
          expect { order.save }.to(
            have_enqueued_job(CaluclateOrderDisburseAmountJob).with(order.id)
          )
        end
      end

      context 'when completed_at is nil' do
        let(:order) { build(:order) }

        it 'does not enqueue Gizmo::SyncJob' do
          expect { order.save }.not_to(
            have_enqueued_job(CaluclateOrderDisburseAmountJob).with(order.id)
          )
        end
      end
    end
  end
end