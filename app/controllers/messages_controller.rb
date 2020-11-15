class MessagesController < ApplicationController

  def index
    # Messageモデルのインスタンス情報を代入
    @message = Message.new
    # paramsに含まれているroom_idを代入
                    # params[:room_id]と記述することでroom_idを取得できる
    @room = Room.find(params[:room_id])
    # チャットルームに紐付いている全てのメッセージをを定義し、ユーザー情報も紐付いて表示させる
        # メッセージに紐付くユーザー情報の取得に、メッセージの数と同じ回数のアクセスが必要になるので、N+1問題が発生
        # 全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができる
    @messages = @room.messages.includes(:user)
  end


  def create
    @room = Room.find(params[:room_id])
    # チャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出す
    @message = @room.messages.new(message_params)
    # その値を@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存
    # @message.save
    if @message.save
      # indexアクションに再度リクエストを送信し、保存後の情報に更新される
      redirect_to room_messages_path(@room)
    else
      # 保存に失敗した場合、同じページに戻る
      render :index
      # @messagesが定義されていないとエラーになってしまうため、indexアクションと同様に@messagesを定義
      @messages = @room.messages.includes(:user)
    end
  end

  private

  def message_params
    # メッセージの内容(content)をmessagesテーブルへ保存できるようにし
      # ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
