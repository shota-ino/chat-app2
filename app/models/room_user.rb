class RoomUser < ApplicationRecord
  # どのユーザーがどのチャットルームに参加しているかを管理するのが、中間テーブル
  belongs_to :room
  belongs_to :user
  
end
