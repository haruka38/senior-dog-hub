class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.string :nickname, null: true
      t.integer :age, null: true

      t.timestamps
    end
  end
end
