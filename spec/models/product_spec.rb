require 'rails_helper'

# fails with ActiveRecord::InvalidForeignKey:
RSpec.describe Product, type: :model do
  subject(:product) { Product.create!(
    product_name: 'Wrangler', 
    product_type: 'cawboy wear', 
    status: true,
    brand_id: 1) }

    it "valid with valid attributes" do
      expect(product).to be_valid
    end

    it "product_name valid with integers?!?!" do
      brand.product_name=1111
      expect(brand).to be_valid
    end

    it "product_type valid with integers?!?!" do
      brand.product_type=1111
      expect(brand).to be_valid
    end

    it "not valid without product_name" do
      product.product_name=nil
      expect(product).to_not be_valid
    end

    it "not valid without product_type" do
      product.product_type=nil
      expect(product).to_not be_valid
    end

    it "is valid with status true" do
      product.status=true
      expect(product).to_not be_valid
    end

    it "is valid with status false" do
      product.status=false
      expect(product).to_not be_valid
    end

end
