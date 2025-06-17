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

  private

  def question_params
    params.require(:question).permit(:nickname, :breed_id, :age, :body)
  end
end
