class AddUserIdToQuestionAnswers < ActiveRecord::Migration[8.0]
  def change
    add_reference :question_answers, :user, foreign_key: true
    add_column :question_answers, :guest_id, :string
  end
end
