require 'rails_helper'

# Fails because of belongs_to :user, optional: true
RSpec.describe User, type: :model do
  subject(:user) { User.create!(
    username: "Test", 
    email: "test@email.com", 
    password: "test-pass",
    password_confirmation: "test-pass") 
  }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without username" do
    user.username=nil
    expect(user).to_not be_valid
  end

  it "is not valid without username" do
    user.username=1111
    expect(user).to be_valid
  end

  it "is not valid without email" do
    user.email=nil
    expect(user).to_not be_valid
  end

  it "is not valid without password" do
    user.password=nil
    expect(user).to_not be_valid
  end

  it "is not valid without password_confirmation" do
    user.password_confirmation=nil
    expect(user).to_not be_valid
  end
end
