class CreateQuestionAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :question_answers do |t|
      t.text :body, null: false
      t.references :question, null: false, foreign_key: true
      # referencesのnull:falseでquestionがないと回答は保存できない

      t.timestamps
    end
  end
end
