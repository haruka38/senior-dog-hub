class AddUserIdToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_reference :questions, :user, foreign_key: true
    add_column :questions, :guest_id, :string
  end
end
