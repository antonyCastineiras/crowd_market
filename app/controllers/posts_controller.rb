class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permisson, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = 'Post did not save'
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to posts_path
  end

  private

  def require_permisson
    post = Post.find(params[:id])
    if current_user != post.user
      flash[:notice] = 'You are not the owner of this post'
      redirect_back
    end
  end

  def post_params
    params.require(:post).permit(:text, :image)
  end
end
