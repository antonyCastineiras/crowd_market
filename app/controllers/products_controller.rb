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

	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to seller_profile_path	(current_seller)
	end


	def get
		product = Product.where("product_name like ?","%#{params[:search_string]}%")
		render :json => { products: product }
	end


	def product_params
		params.require(:product).permit(:product_name,:product_description,:price,:sellers_fee, :search_string, :image)
	end

end
