class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # user等と紐づける時はinclideにした方がいいかも
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find(params[:id])
    # idの部分にはURLのquestionの数字部分が入る
    @question_answer = QuestionAnswer.new
    @question_answers = @question.question_answers
  end

  private

  def question_params
    params.require(:question).permit(:nickname, :breed_id, :age, :body)
  end
end
