class CreateBreeds < ActiveRecord::Migration[8.0]
  def change
    create_table :breeds do |t|
      t.string :name, null: true

      t.timestamps
    end
  end
end
