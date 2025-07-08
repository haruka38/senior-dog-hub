class CreateStamps < ActiveRecord::Migration[8.0]
  def change
    create_table :stamps do |t|
      t.references :user, null: true, foreign_key: false
      # usersテーブルを作ったらforeign_keyをtrueにする
      t.references :stamp_type, null: false, foreign_key: true
      t.references :stampable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
