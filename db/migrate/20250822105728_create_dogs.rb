class CreateDogs < ActiveRecord::Migration[8.0]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.date :birthday
      t.integer :disease, default: 0, null: false
      t.string :family_hospital_name
      t.string :family_hospital_tel
      t.string :family_hospital_address
      t.string :emergency_hospital_name
      t.string :emergency_hospital_tel
      t.string :emergency_hospital_address
      t.string :taxi_tel

      t.references :user, null: false, foreign_key: true
      t.references :breed, null: true, foreign_key: true

      t.timestamps
    end
  end
end
