FactoryBot.define do
  factory :order do
    merchant
    shopper
    amount {FFaker::Number.decimal}
  end

  trait :completed do
    completed_at {DateTime.now.at_beginning_of_week}
  end
end
