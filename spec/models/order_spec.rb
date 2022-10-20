require 'rails_helper'

RSpec.describe Order, type: :model do

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

  subject(:brand) { Brand.create!(
    name: "SomeBrand", 
    address: "Some addres somewhere in the world",
    email: "some@email.com", 
    status: true )
  }

  subject(:product) { Product.create!(
    product_name: 'Wrangler', 
    product_type: 'cawboy wear', 
    status: true,
    brand_id: brand.id) 
  }
  
  subject(:order) { Order.create!(
    final_amount: 99.99, 
    currency: "USD",
    quantity: "1", 
    status: true,
    voucher_id: voucher.id,
    product_id: product.id )
  }

    it "is valid with valid attributes" do
      expect(order).to be_valid
    end

    it "not valid with negative number?!?!" do
      order.final_amount=-500
      expect(order).to_not be_valid
    end
    
    it "not valid with nil currency" do
      order.currency=nil
      expect(order).to_not be_valid
    end

    it "not valid with currency bigger than 6 chars" do
      order.currency='usdgbpeuro'
      expect(order).to_not be_valid
    end

    it "not valid without quantity" do
      order.quantity=nil
      expect(order).to_not be_valid
    end

    it "not valid with negative quantity" do
      order.quantity=-1
      expect(order).to_not be_valid
    end

    it "not valid with quantity bigger than 99" do
      order.quantity=100
      expect(order).to_not be_valid
    end

    it "not valid with nil" do
      order.quantity=nil
      expect(order).to_not be_valid
    end

    it "valid with status true" do
      order.status=true
      expect(order).to be_valid
    end

    it "valid with status false" do
      order.status=false
      expect(order).to be_valid
    end
end
