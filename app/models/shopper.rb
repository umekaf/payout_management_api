class Shopper < ApplicationRecord
  has_many :orders, dependent: :destroy
  
  validates :email, :name, :nif, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :nif, uniqueness: { case_sensitive: false }
end
