class UsersController < ApplicationController
  skip_before_action :login_check, except: [:show]
  before_action :user_check, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome!"
      log_in(@user)
      redirect_to user_path(@user)
    else
      if @user.errors.any?
        @user.errors.full_messages.each_with_index do |e, i|
          flash.now["error_#{i+1}"] = e
        end
      end
      render 'petit/index'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
