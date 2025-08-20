class QuestionAnswersController < ApplicationController
  before_action :set_question_answer, only: [ :new, :edit, :update, :destroy ]
  before_action :authorize_answer_user_or_guest, only: [ :edit, :update, :destroy ] # ユーザーがログインしているかの確認
  before_action :correct_answer_user_or_guest?, only: [ :edit, :update, :destroy ] # ユーザーが投稿者かどうかの確認

  def new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    @question_answer = @question.question_answers.new(question_answer_params)

    if user_signed_in?
      @question_answer.user = current_user
    else
      @question_answer.guest_id = cookies[:guest_id]
    end

    if @question_answer.save
      redirect_to question_path(@question), notice: "回答を投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @question = @question_answer.question
  end

  def update
    if @question_answer.update(question_answer_params)
      redirect_to question_path(@question_answer.question), notice: "回答を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question_answer.destroy
    redirect_to question_path(@question_answer.question), notice: "回答を削除しました"
  end

  private

  def question_answer_params
    params.require(:question_answer).permit(:body)
  end

  def set_question_answer
    @question_answer = QuestionAnswer.find(params[:id])
    # idの部分にはURLのquestionの数字部分が入る
  end

  def correct_answer_user_or_guest?
    (current_user && @question_answer.user == current_user) ||
    (!current_user && @question_answer.guest_id == cookies[:guest_id])
  end

  def authorize_answer_user_or_guest
    redirect_to questions_path, alert: "権限がありません" unless correct_answer_user_or_guest?
  end
end
