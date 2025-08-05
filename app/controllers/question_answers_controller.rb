class QuestionAnswersController < ApplicationController
  # ANSWER_STAMP_TYPE_IDS   = [3, 4] # 参考になる、いいね

  # before_action :set_answer_stamp_types

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

  # def set_answer_stamp_types
    # @answer_stamp_types = StampType.where(id: ANSWER_STAMP_TYPE_IDS)
  # end
end
