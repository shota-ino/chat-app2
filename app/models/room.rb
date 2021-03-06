class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  # Room（親モデル）が削除されたときに、↑Message（子モデル）とUser（子モデル）が通るRoomUser（中間テーブルのモデル）も削除される

  # 「ルーム名」は必ず必要なので、上記のバリデーションは「ルーム名が存在（presence）している場合のみ作成可（true）」
  validates :name, presence: true
end
