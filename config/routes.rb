Rails.application.routes.draw do
  devise_for :users

  # get 'messages/index'
  # ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出される
  # root to: "messages#index"

  
  root to: "rooms#index"


  # ユーザー編集に必要なルーティング
  resources :users, only: [:edit, :update]
  # 新規チャットルームの作成で動くアクションは「new」と「create」のみ
  # resources :rooms, only: [:new, :create]

  # チャットルームに属しているメッセージ（ルーティングのネスト）
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
