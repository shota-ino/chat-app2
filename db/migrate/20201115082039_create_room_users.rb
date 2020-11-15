class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # referencesは他テーブルから情報を参照する際に用いる型
                          # foreign_key: trueという制約で他テーブルの情報を参照
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
