require 'rails_helper'

RSpec.describe Voucher, type: :model do
  subject { Voucher.create!(balance: 250.99, currency: 'USD', secret_code: 'super-secret-code',
    expires_on: Date.today + 7.days, users_id: 5) }

    # fail
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is valid with nil currency" do
      subject.currency=nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a balance" do
      subject.balance=nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a secret_code" do
      subject.secret_code=nil
      expect(subject).to_not be_valid
    end

    it "is not valid with integer" do
      subject.secret_code=12345
      expect(subject).to_not be_valid
    end
end
