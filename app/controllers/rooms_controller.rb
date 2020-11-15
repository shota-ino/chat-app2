class RoomsController < ApplicationController
  # チャットルームの新規作成なので「new」アクションを定義
  def new
    # form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    @room = Room.new
  end

  def create
    # binding.pry その後Cでparams
    # プルダウンを利用したときにどのようなデータが送信されるのか確認
    # "room"=>{"name"=>"新規チャット", "user_ids"=>["1", "2"]}に注目
    # カリキュラム4711の『送信されるデータを確認しましょう』を参照

    @room = Room.new(room_params)
    # 保存が成功したかどうかで処理を分岐
    if @room.save
      # 成功した場合はredirect_toメソッドでルートパスにリダイレクト
      redirect_to root_path
    else
      # 失敗した場合はrenderメソッドでrooms/new.html.erbのページを表示
      render :new
    end

  end

  private

  def room_params
    # 配列として受け取ったデータを含むストロングパラメーターを定義
                  # 配列に対して保存を許可したい場合は、キーに対し[]を値として記述# 
    params.require(:room).permit(:name, user_ids: [])
  end


end
