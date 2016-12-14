class Users::PagesController < ApplicationController

  def show
    User.find(params[:id]) == current_user ? @user = current_user : @user = User.find(params[:id])
    @image = Image.new
    @friendship = Friendship.new
    @posts = Post.all
  end

  def sign_in
  	@user = User.new
  	@seller = Seller.new
  end

  def page_params
  	params.require(:page).permit(:id)
  end
end
