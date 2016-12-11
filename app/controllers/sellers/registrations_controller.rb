class Sellers::RegistrationsController < Devise::RegistrationsController
	def after_sign_up_path_for(resource)
    seller_profile_path(resource)
  end
end