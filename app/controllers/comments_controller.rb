class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      flash[:notice] = "Comment successfully updated!"
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:alert] = "Comment successfully deleted!"
    end
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :entry, :date)
  end
end
