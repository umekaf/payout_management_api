class MerchantDisbursement < ApplicationRecord
  belongs_to :order
  belongs_to :merchant

  validates :disburse_amount, presence: true
end
