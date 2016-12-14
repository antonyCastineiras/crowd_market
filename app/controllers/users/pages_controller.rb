class Users::PagesController < ApplicationController

  def show
    @friends_posts = []
    if current_user
      get_posts_from_friends
    end
    User.find(params[:id]) == current_user ? @user = current_user : @user = User.find(params[:id])
    @image = Image.new
    @friendship = Friendship.new
    @posts = Post.all
  end

  def sign_in
  	@user = User.new
  	@seller = Seller.new
  end

  private

  def page_params
  	params.require(:page).permit(:id)
  end

  def get_posts_from_friends
    current_user.friends.each do |friend|
      friend.posts.each do |post|
        @friends_posts.push(post)
      end
    end
    @friends_posts = @friends_posts.sort_by { |post| [post.created_at, post.updated_at].max }.reverse!
  end

end
