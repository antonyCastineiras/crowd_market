class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permisson, only: [:edit, :update, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to ('/posts')
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment Deleted'
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comments)
  end

  def require_permisson
    comment = Comment.find(params[:id])
    if current_user != comment.user
      flash[:notice] = 'You are not the owner of this comment'
      redirect_to posts_path
    end
  end
end
