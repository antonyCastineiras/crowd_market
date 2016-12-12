class AdvertsController < ApplicationController
	def create
		@advert = Advert.new(advert_params)
		if @advert.save
			render :json => { message: "success"}
		else
			render :json => { message: "failiure"}, :status => 500
		end
	end

	def advert_params
		params.permit(:width,:height,:top,:left,:post_id, :user_id)
	end
end
