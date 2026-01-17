class GenerateQuestionEmbeddingJob < ApplicationJob
  queue_as :default

  def perform(question_id)
    question = Question.find_by(id: question_id)
    return unless question
    return if question.embedding.present?

    embedding = EmbeddingService.generate_embedding(question.body)

    sleep 0.2

    return unless embedding

    question.update!(embedding: embedding)
  end
end
