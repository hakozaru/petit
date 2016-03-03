class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :user_check

  def index
    @user = User.find_by(id: session[:user_id])
    @posts = Post.where(user_id: session[:user_id]).all
  end

  def show
    @user = User.find_by(id: session[:user_id])
    if @post == nil
      flash[:could_not_find_post] = "記事が見つかりません"
      redirect_to user_posts_path
    end
  end

  def new
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @post = @user.post.new(post_params)
    if @post.save
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end

  private
  def set_post
    @post = Post.where(user_id: session[:user_id]).find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :tfield)
  end
end
