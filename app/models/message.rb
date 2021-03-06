class Message < ApplicationRecord
  # 1つのチャットルームに、メッセージは複数存在します。
  # 1人のユーザーは、複数のメッセージを送信できます。
  belongs_to :room
  belongs_to :user

  # 空の場合はDBに保存しない
  validates :content, presence: true
end
