module Api
  module V1
    class MerchantDisbursementsController < ActionController::API
      before_action :set_default_format
      
      def index
        if params[:merchant_id]
          merchant_disbursements = MerchantDisbursement.where('created_at >=? AND merchant_id =?', DateTime.now.at_beginning_of_week, params[:merchant_id])
        else
          merchant_disbursements = MerchantDisbursement.where('created_at >=?', DateTime.now.at_beginning_of_week)
        end
        amount_for_merchant = merchant_disbursements.group('merchant_id').sum(:disburse_amount).sort

        render locals: {merchant_amounts: amount_for_merchant }
      end

      private

      def set_default_format
        request.format = :json
      end
    end
  end
end
