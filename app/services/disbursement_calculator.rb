class DisbursementCalculator
  def initialize(order_id)
    @order_id = order_id
  end
  attr_reader :order_id
  def call
    order = Order.find_by_id(order_id)
    merchant = order.merchant
    fee_amount = calculate_disburse_amount(order.amount)
    disburse_amount = order.amount - fee_amount
    MerchantDisbursement.create!(order_id: order_id, merchant_id: merchant.id, disburse_amount: disburse_amount)
  end

  def calculate_disburse_amount(amount)
    less_than_50 = amount < 50
    between_50_and_300 = amount.between? 50, 300
    more_than_300 = amount > 300
    case amount
    when less_than_50
      1.to_f/100 * amount
    when between_50_and_300
      0.95/100 * amount
    else
      0.85/100 * amount
    end
  end
end
