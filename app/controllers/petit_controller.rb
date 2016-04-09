class PetitController < ApplicationController
  skip_before_action :login_check

  def index
    # すでにログインしていれば、即ユーザーページに飛ぶ
    if logged_in?
      redirect_to user_path(current_user)
    else
      # ユーザー登録用
      @user = User.new

      # bodyなどにクラス追加
      @body = "petit_index"
      @main = "main_index"
      @footer = "footer_index"
    end
  end
end
