class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  has_many :merchant_disbursements, dependent: :destroy
  
  validates :amount, presence: true
  
  after_save_commit :calculate_disbursement_amount_for_completed_order
  
  private

  def calculate_disbursement_amount_for_completed_order
    return unless completed?
    CaluclateOrderDisburseAmountJob.perform_later(id)
  end

  def completed?
    completed_at_before_last_save == nil && completed_at != nil
  end
end
