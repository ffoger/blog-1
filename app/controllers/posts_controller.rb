class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(10)
  end


  def search
    if params[:search]
      @posts = Post.all.search(params[:search]).order("created_at DESC").page(params[:page]).per(10)
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

private

  def post_params
    post_params = params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find params[:id]
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "please sign in" unless user_signed_in?
  end


end
