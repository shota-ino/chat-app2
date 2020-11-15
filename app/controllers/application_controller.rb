class ApplicationController < ActionController::Base
  # ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!
  # 全てのアクションが実行される前に、deviseのコントローラーから呼び出される
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    # nameキーの内容の保存をpermitメソッドで許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
