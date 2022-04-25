class Merchant < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :merchant_disbursements, dependent: :destroy
  
  validates :email, :name, :cif, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :cif, uniqueness: { case_sensitive: false }
end
