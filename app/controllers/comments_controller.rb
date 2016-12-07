class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permisson, only: [:edit, :update, :destroy]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
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
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def require_permisson
    comment = Comment.find(params[:id])
    if current_user != comment.user
      flash[:notice] = 'You are not the owner of this comment'
      redirect_to posts_path
    end
  end
end
