class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      # room名のみを保存するのでnameのみ
      t.string :name, null: false
      t.timestamps
    end
  end
end
