class AddBreedToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_reference :questions, :breed, null: true, foreign_key: true
  end
end
