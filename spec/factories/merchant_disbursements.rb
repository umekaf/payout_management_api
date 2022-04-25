FactoryBot.define do
  factory :merchant_disbursement do
    disburse_amount { 1.5 }
    order
    merchant
  end
end
