class SessionsController < ApplicationController
  skip_before_action :login_check

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = 'Welcome !'
      redirect_to @user
    else
      flash[:invalid] = 'ログインに失敗しました'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
