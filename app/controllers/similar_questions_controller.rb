class SimilarQuestionsController < ApplicationController
  def index
    return render turbo_stream: turbo_stream.replace(
      "similar_questions",
      partial: "questions/similar_questions",
      locals: { questions: [] }
    ) if params[:query].blank?

    embedding = EmbeddingService.generate_embedding(params[:query])
    questions = embedding ? Question.similar_to(embedding) : []

    render turbo_stream: turbo_stream.replace(
      "similar_questions",
      partial: "questions/similar_questions",
      locals: { questions: questions }
    )
  end
end
