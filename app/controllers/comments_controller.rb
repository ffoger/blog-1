class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @comment = Comment.new
  end

  def create
    @comment.user = current_user
    @comment = Comment.new comment_params
    @post = Post.find params[:post_id]
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: "Commnet created!"
    else
      render "/posts/show"
    end
  end

  def show
  end

  def index
    @comments = Comment.order("created_at DESC")
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find params[:post_id]
    @comment.destroy
    redirect_to post_path(post), notice: "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end


end
