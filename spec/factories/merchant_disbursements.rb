FactoryBot.define do
  factory :merchant_disbursement do
    disburse_amount { FFaker::Number.decimal }
    order
    merchant
  end
end
