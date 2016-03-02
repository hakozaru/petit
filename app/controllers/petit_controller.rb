class PetitController < ApplicationController
  skip_before_action :login_check

  def index
    # すでにログインしていれば、即ユーザーページに飛ぶ
    if logged_in?
      redirect_to user_path(current_user)
    end
  end
end
