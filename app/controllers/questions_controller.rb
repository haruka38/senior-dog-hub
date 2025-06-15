class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    # user等と紐づける時はinclideにした方がいいかも
  end
end
