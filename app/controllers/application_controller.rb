class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_user

  def set_user
  	@user = current_user if current_user
  end
end
