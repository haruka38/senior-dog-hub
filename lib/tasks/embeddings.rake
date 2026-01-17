namespace :questions do
  desc "既存の質問データにベクトルを生成"
  task generate_embeddings: :environment do
    puts "質問データのベクトル生成を開始します"

    questions = Question.where(embedding: nil)

    puts "対象件数: #{questions.count} 件"

    questions.find_each(batch_size: 50) do |question|
      begin
        puts "処理中: Question ##{question.id}"

        embedding = EmbeddingService.generate_embedding(question.body)

        if embedding.present?
          question.update!(embedding: embedding)
          puts "  → 保存完了"
        else
          puts "  → embedding が生成されませんでした"
        end

        # API叩きすぎ防止（重要）
        sleep 0.2

      rescue => e
        puts "  → エラー: #{e.message}"
      end
    end

    puts "ベクトル生成が完了しました"
  end
end
