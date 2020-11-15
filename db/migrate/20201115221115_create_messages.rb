class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      # messagesテーブルと関連性を持つ場合に必要なカラム
                        # 外部キー（今回であればroom_idとuser_id）がないとDBに保存できないように
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
