# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::MerchantDisbursements', type: :request do
  describe '#index' do
    context 'when params is sent' do
      let(:merchant) {create(:merchant)}
      let(:expected_response) do
        {
          data: [
            {
              merchant_id: merchant.id,
              disburse_amount: 41.44
            }
          ]
        }
      end
      let(:merchant_disbursement) { create(:merchant_disbursement, disburse_amount: 41.44, merchant: merchant) }

      before {merchant_disbursement}

      it 'returns records for only sent merchant id' do
        get "/api/v1/merchant_disbursements?merchant_id=#{merchant.id}"
        expect(parsed_response).to eq(expected_response)
      end
    end
  end
end