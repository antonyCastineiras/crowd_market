class ProductsController < ApplicationController
	def create
		product = Product.create(product_params)
		product.seller = current_seller
		product.save
		redirect_to seller_profile_path(current_seller)
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		product = Product.find(params[:id])
		product.update(product_params)
		redirect_to seller_profile_path(current_seller)
	end

	def show
		@product = Product.find(params[:id])
	end

	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to seller_profile_path	(current_seller)
	end


	def product_params
		params.require(:product).permit(:product_name,:product_description,:price,:sellers_fee)
	end
end
