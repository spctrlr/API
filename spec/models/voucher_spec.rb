require 'rails_helper'

RSpec.describe Voucher, type: :model do
  subject(:user) { User.create!(
    username: "Test", 
    email: "test@email.com", 
    password: "test-pass",
    password_confirmation: "test-pass") 
  }

  subject(:voucher) { Voucher.create!(
    balance: 250.99, 
    currency: 'USD', 
    secret_code: 'super-secret-code',
    user_id: user.id) 
  }

    it "valid with valid attributes" do
      expect(voucher).to be_valid
    end

    it "not valid with nil currency" do
      voucher.currency=nil
      expect(voucher).to_not be_valid
    end

    it "not valid without a balance" do
      voucher.balance=nil
      expect(voucher).to_not be_valid
    end

    it "not valid without a secret code" do
      voucher.secret_code=nil
      expect(voucher).to_not be_valid
    end

    it "valid with integer" do
      voucher.secret_code=12345
      expect(voucher).to be_valid
    end
end
