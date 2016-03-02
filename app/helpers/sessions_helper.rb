module SessionsHelper
  # 渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログインしているユーザーを返す (ユーザーがログイン中の場合のみ)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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
  # TODO: 下二つをなんとかまとめられないものか・・・
  # controller_nameとか使って分けられそう
  def user_check_for_posts
    if params[:user_id].to_i != session[:user_id]
      flash[:error] = "アクセスエラーが発生しました、時間をおいてもう一度お試しください。"
      redirect_to user_path(current_user)
    end
  end

  def user_check_for_user
    if params[:id].to_i != session[:user_id]
      flash[:error] = "アクセスエラーが発生しました、時間をおいてもう一度お試しください。"
      redirect_to user_path(current_user)
    end
  end
end
