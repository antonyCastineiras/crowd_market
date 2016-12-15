class Sellers::RegistrationsController < Devise::RegistrationsController

	def create
		super
	end

	def after_sign_up_path_for(resource)
    seller_profile_path(resource)
  end

	private

	def sign_up_params
		params.require(:seller).permit(:shop_name, :first_name, :last_name, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:seller).permit(:shop_name, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
	end

end
