class Sellers::PagesController < ApplicationController

	def show
		current_seller || current_user == Seller.find(params[:seller_id]) ? @seller = current_seller : @seller = Seller.find(params[:seller_id])
		@product = Product.new
	end
end
