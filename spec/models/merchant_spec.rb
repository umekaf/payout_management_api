require 'rails_helper'

describe Merchant do
  describe '#associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
    it { is_expected.to have_many(:merchant_disbursements).dependent(:destroy) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to allow_value('').for(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.not_to allow_value('').for(:email) }
    it { is_expected.to validate_presence_of(:cif) }
    it { is_expected.not_to allow_value('').for(:cif) }

    it do 
      expect(build(:merchant)).to validate_uniqueness_of(:email).case_insensitive
      expect(build(:merchant)).to validate_uniqueness_of(:cif).case_insensitive
    end
  end
end