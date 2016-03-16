class PetitController < ApplicationController
  skip_before_action :login_check

  def index
    # すでにログインしていれば、即ユーザーページに飛ぶ
    if logged_in?
      redirect_to user_path(current_user)
    else
      # ユーザー登録用
      @user = User.new

      # トップページだけbodyにクラス追加して、背景を表示する
      @body = "petit_index"
      @footer = "footer_index"
    end
  end
end
