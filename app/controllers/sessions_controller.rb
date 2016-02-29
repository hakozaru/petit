class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in @user
      flash[:success] = 'Welcome !'
      redirect_to @user
    else
      flash.now[:invalid] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
  end
end
