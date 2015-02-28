require 'rails_helper'

describe Product do
	before do
    @product = Product.new
	end
	context "validations" do
		#it { should validate_presence_of(:name) }
		it "should validate presence of name" do
		  @product.name = nil
		  @product.valid?
		  expect(@product.errors[:name]).to eq(["can't be blank"])
      #expect(@product.errors[:name]).not_to be_blank
		end
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:price) }
		# it { should validate_numericality_of(:price) }
		it "should return error if value is invalid" do
			@product.price = "abc"
			@product.valid?
			expect(@product.errors[:price]).to eq(["is not a number"])
		end

		it "should  not return error if value is valid" do
			@product.price = 123
			@product.valid?
			expect(@product.errors[:price]).to be_blank
		end

		it "should have a image attachment" do
			expect{@product.image}.not_to raise_error 
		end

		it "should accepts correct image format" do
			@product.image = File.open(Rails.root.to_s + '/app/assets/images/me.jpg')
			@product.valid?
			expect(@product.errors[:image]).to be_blank
		end

		it "should return error if format is invalid" do
			@product.image = File.open(Rails.root.to_s + '/app/models/product.rb')
			@product.valid?
			expect(@product.errors[:image]).to eq(["has an extension that does not match its contents", "is invalid"])
		end
	end
end