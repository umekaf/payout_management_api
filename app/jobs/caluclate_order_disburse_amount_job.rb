class CaluclateOrderDisburseAmountJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    DisbursementCalculator.new(order_id).call
  end
end
