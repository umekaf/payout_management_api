require 'rails_helper'

describe Shopper do
  describe '#associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end

  describe "#validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to allow_value('').for(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.not_to allow_value('').for(:email) }
    it { is_expected.to validate_presence_of(:nif) }
    it { is_expected.not_to allow_value('').for(:nif) }

    it do 
      expect(build(:shopper)).to validate_uniqueness_of(:email).case_insensitive
      expect(build(:shopper)).to validate_uniqueness_of(:nif).case_insensitive
    end
  end
end