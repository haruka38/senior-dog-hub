class QuestionsController < ApplicationController
  include StampsHelper

  before_action :set_question_stamp_types
  before_action :set_answer_stamp_types
  before_action :set_question, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user_or_guest, only: [ :edit, :update, :destroy ] # ユーザーがログインしているかの確認
  before_action :correct_user_or_guest?, only: [ :edit, :update, :destroy ] # ユーザーが投稿者かどうかの確認

  def index
    @search = Question.ransack(params[:q])
    @search.sorts = "updated_at desc" if @search.sorts.empty?
    @questions = @search.result.page(params[:page])
    # user等と紐づける時はinclideにした方がいいかも
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if user_signed_in?
      @question.user = current_user
    else
      @question.guest_id = cookies[:guest_id]
    end

    if @question.save
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @question_answer = QuestionAnswer.new
    @question_answers = @question.question_answers
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "質問を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "質問を削除しました"
  end

  def my_questions
    @questions = current_user.questions.order(created_at: :desc)
  end

  private

  def set_question
    @question = Question.find(params[:id])
    # idの部分にはURLのquestionの数字部分が入る
  end

  def question_params
    params.require(:question).permit(:nickname, :breed_id, :age, :body)
  end

  def set_question_stamp_types
    @question_stamp_types = StampType.where(id: QUESTION_STAMP_TYPE_IDS)
  end

  def set_answer_stamp_types
    @answer_stamp_types = StampType.where(id: ANSWER_STAMP_TYPE_IDS)
  end

  def correct_user_or_guest?
    (current_user && @question.user == current_user) ||
    (!current_user && @question.guest_id == cookies[:guest_id])
  end

  def authorize_user_or_guest
    redirect_to questions_path, alert: "権限がありません" unless correct_user_or_guest?
  end
end
