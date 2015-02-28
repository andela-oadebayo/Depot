require 'rails_helper'

describe ProductsController do
	context "GET #index" do

		# by default this uses factory girl
		# let(:product) { create :product }
		let(:product) { FactoryGirl.create(:product) }		

		it "should return all products" do
			# sending a request 
			expect(Product).to receive(:all).and_return([product])
			get :index			
			expect(response).to be_success
			expect(response).to render_template("index")
		end
	end

	context "GET #new" do
		let(:product) { FactoryGirl.build(:product) }	

		it "should initialize a new product" do
			expect(Product).to receive(:new).and_return(product)
			get :new
			expect(response).to be_success
			expect(response).to render_template("new")
		end
	end

	context "POST #create" do
		let(:product) { FactoryGirl.create(:product) }

		it "should save a new product" do
			expect(Product).to receive(:new).and_return(product)
			expect(product).to receive(:save).and_return(true)
			post :create, product: {name: "Mac Book Pro", description: "A great computer", price: 1200}
			expect(response).to be_redirect
			expect(response).to redirect_to(products_path)
		end

		it "should return errors with invalid data" do
			expect(Product).to receive(:new).and_return(product)
			expect(product).to receive(:save).and_return(false)
			post :create, product: {name: "", description: "", price: 200}
			expect(response).to be_success
			expect(response).to render_template("new")
		end
	end

	context "GET #edit" do
		let(:product) { FactoryGirl.create(:product)}

		it "assigns the requested product as @product" do
			expect(Product).to receive(:find).and_return(product)
			get :edit, id: product.id
			expect(response).to be_success
			expect(response).to render_template("edit")
		end
	end

	context "PUT #update" do
		let(:product) { FactoryGirl.create(:product) }
		let(:valid_product_params) { FactoryGirl.attributes_for(:product) }

		it "updates the requested product" do
			expect(Product).to receive(:find).and_return(product)
			expect(product).to receive(:update_attributes).and_return(true)
			put :update, id: product.id, product: valid_product_params
			expect(response).to be_redirect
      expect(response).to redirect_to(products_path)
		end
	end

	context "DELETE #destroy" do
		let(:product) { FactoryGirl.create(:product) }
		it "should delete a product" do
			expect(Product).to receive(:find).and_return(product)
      expect(product).to receive(:destroy).and_return(true)
			delete :destroy, id: product.id
			expect(response).to redirect_to(products_path)
		end
	end
end
