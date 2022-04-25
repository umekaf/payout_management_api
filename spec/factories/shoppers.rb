FactoryBot.define do
  factory :shopper do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    nif { FFaker::IdentificationTW.id }
  end
end
