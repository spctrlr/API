require 'rails_helper'

RSpec.describe Brand, type: :model do
  subject(:brand) { Brand.create!(
    name: "SomeBrand", 
    address: "Some addres somewhere in the world",
    email: "some@email.com", 
    status: true )
  }

  it "is valid with valid attributes" do
    expect(brand).to be_valid
  end

  it "not valid without name" do
    brand.name=nil
    expect(brand).to_not be_valid
  end

  it "name is valid with integers?!?!" do
    brand.name=1111
    expect(brand).to be_valid
  end

  it "not valid without email" do
    brand.email=nil
    expect(brand).to_not be_valid
  end

  it "valid with status" do
    brand.status=true
    expect(brand).to be_valid
  end

end
