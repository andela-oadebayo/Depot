class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
	  if @product.update_attributes(product_params)
	    # Handle a successful update.
	    redirect_to products_path
		else
	    render 'edit'
	  end
	end

	def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
	end

	private

	def product_params
		params[:product].permit(:name, :description, :price, :image)
	end
end
