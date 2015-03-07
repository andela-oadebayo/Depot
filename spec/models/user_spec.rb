require 'rails_helper'

describe User do
  before do
    @user = User.new
  end
  context "validations" do
    it "should validate presence of name" do
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to eq(["can't be blank"])
    end

    it "should validate presence of email" do
      @user.email = nil 
      @user.valid?
      expect(@user.errors[:email]).to eq(["can't be blank"])
    end
  end
end