class CreateStampTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :stamp_types do |t|
      t.string :name, null: false
      t.string :icon, null: false

      t.timestamps
    end

    StampType.create!(name: "それ知りたい", icon: "far fa-hand")
    StampType.create!(name: "わかる", icon: "far fa-face-laugh")
  end
end
