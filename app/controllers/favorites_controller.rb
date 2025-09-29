class FavoritesController < ApplicationController
before_action :authenticate_user!
before_action :set_question

  def index
    @favorite_questions = current_user.favorites.includes(:question).map(&:question)
  end

  def create
    question = Question.find(params[:question_id])
    current_user.favorites.create!(question: question)
    # ユーザーを元いた画面に返す。ただし返す場所が不明なら一覧に戻す
    redirect_back(fallback_location: question_favorite_path(@question))
  end

  def destroy
    favorite = current_user.favorites.find_by!(question_id: params[:question_id])
    favorite.destroy
    redirect_back(fallback_location: question_favorite_path(@question))
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
