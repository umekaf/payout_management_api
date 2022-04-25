json.data merchant_amounts do |merchant|
  json.merchant_id merchant[0]
  json.disburse_amount merchant[1]
end