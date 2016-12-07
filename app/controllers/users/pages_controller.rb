class Users::PagesController < ApplicationController

  def show
    @user = current_user
    @image = Image.new
    @friendship = Friendship.new
  end
end
