class CreateMerchantDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :merchant_disbursements do |t|
      t.float :disburse_amount
      t.references :order, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
