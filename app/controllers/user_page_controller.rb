class UserPageController < ApplicationController
  before_action :find_user
  skip_before_action :login_check

  def index
    user_id = User.find_by(name: params[:username]).try(:id)
    if user_id
      @posts = Post.where(user_id: user_id)
    else
      flash[:could_not_find_post] = "お探しのページは見つかりませんでした"
      redirect_to root_path
    end
  end

  private
  def find_user
    @user = User.find_by(id: session[:user_id])
  end
end
