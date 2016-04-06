module SessionsHelper
  # 渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログインしているユーザーを返す
  def current_user
    @user
  end

  # 現在のユーザーをDBから読み込む
  def load_user
    @user = User.find_by(id: session[:user_id])
    return true
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # 常にログインチェックする
  def login_check
    redirect_to root_path unless logged_in?
  end

  # 自分に関連するページのみ閲覧可能
  def user_check
    check_param = controller_name == "users" ? params[:id].to_i : params[:user_id].to_i
    if check_param != session[:user_id]
      flash[:error] = "アクセスエラーが発生しました、時間をおいてもう一度お試しください。"
      redirect_to user_path(current_user)
    end
  end
end
