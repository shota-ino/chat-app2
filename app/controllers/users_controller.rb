class UsersController < ApplicationController

  # ビューファイルを表示するだけなので、アクションの定義のみ
  def edit
  end

  # Userモデルの更新を行うupdateアクションを定義
  def update
    # ログインしているユーザーの情報を更新（ストロングパラメーターにて）
    # current_user.update(user_params)
    if current_user.update(user_params)
      # 成功した場合、root（チャット画面）にリダイレクトし
      redirect_to root_path
    else
      # 失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示
      render :edit
    end
  end

  private

  def user_params
    # user_paramsの中でpermitメソッドを使用し、「name」と「email」の編集を許可
    params.require(:user).permit(:name, :email)
  end

end
