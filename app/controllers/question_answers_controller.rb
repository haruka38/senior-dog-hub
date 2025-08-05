class QuestionAnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question_answer = @question.question_answers.new(question_answer_params)

    if @question_answer.save
      redirect_to question_path(@question), notice: "回答を投稿しました"
    else
      redirect_to question_path(@question), notice: "回答に失敗しました"
    end
  end

  def edit
  end

  def destroy
  end

  private

  def question_answer_params
    params.require(:question_answer).permit(:body)
  end
end
