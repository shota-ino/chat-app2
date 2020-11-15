class RoomsController < ApplicationController
  # チャットルームの新規作成なので「new」アクションを定義
  def new
    # form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    @room = Room.new
  end

end
