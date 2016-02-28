class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome!"
      redirect_to root_path
    else
      flash[:fail] = "One more!"
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
