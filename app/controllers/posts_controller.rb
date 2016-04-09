class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:index, :show, :new, :edit, :create, :user_page]
  before_action :user_check, except: [:user_page]
  before_action :login_check, except: [:user_page]

  def index
    @posts = Post.where(user_id: session[:user_id]).all
  end

  def show
    @comment = Comment.new
    if @post == nil
      flash[:could_not_find_post] = "記事が見つかりません"
      redirect_to user_posts_path
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = @user.post.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      if @post.errors.any?
        @post.errors.full_messages.each_with_index do |e, i|
          flash.now["error_#{i+1}"] = e
        end
      end
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

  def user_page
    params[:username] = User.find_by(id: session[:user_id]).name
    @posts = Post.where(user_id: session[:user_id])
    if @posts.blank?
      flash[:could_not_find_post] = "記事が見つかりません"
      redirect_to root_path
    end
  end

  private
  def set_post
    @post = Post.where(user_id: session[:user_id]).find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :tfield)
  end

  def find_user
    @user = User.find_by(id: session[:user_id])
  end
end
