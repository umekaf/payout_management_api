FactoryBot.define do
  factory :merchant do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    cif { FFaker::IdentificationTW.id }
  end
end
