class EmbeddingService
  EMBEDDING_MODEL = "text-embedding-3-small"
  MAX_TOKENS = 8192

  class << self
    def generate_embedding(text)
      return nil if text.blank?

      truncated_text = truncate_text(text)

      Rails.logger.info "OPENAI KEY present?: #{Rails.application.credentials.dig(:openai, :api_key).present?}"

      client = OpenAI::Client.new(access_token: Rails.application.credentials.dig(:openai, :api_key))

      response = client.embeddings(
        parameters: {
          model: EMBEDDING_MODEL,
          input: truncated_text,
          encoding_format: "float"
        }
      )

      embedding = response.dig("data", 0, "embedding")

      Rails.logger.info "ベクトル生成完了: #{truncated_text[0..50]}... (次元数: #{embedding&.size})"
      embedding

    rescue StandardError => e
      Rails.logger.error "ベクトル生成エラー: #{e.message}"
      nil
    end

    private

    def truncate_text(text)
      max_chars = MAX_TOKENS * 3
      text.length > max_chars ? text[0...max_chars] : text
    end
  end
end
