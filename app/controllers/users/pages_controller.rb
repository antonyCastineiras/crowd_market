class Users::PagesController < ApplicationController

  def show
    @user = current_user
  end
end
