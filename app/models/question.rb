class Question < ApplicationRecord
  after_commit :enqueue_embedding_job, on: :create

  validates :body, presence: true, length: { maximum: 65_535 }
  validates :nickname, length: { maximum: 32 }, allow_blank: true
  validates :age, numericality: { only_integer: true }, allow_blank: true

  belongs_to :user, optional: true
  belongs_to :breed, optional: true
  # optional: trueでbreedを必須ではなくする
  has_many :question_answers, dependent: :destroy
  has_many :stamps, as: :stampable, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
  has_neighbors :embedding

  def self.ransackable_associations(auth_object = nil)
    [ "breed", "question_tags", "tags" ]
  end

  # ransackで検索したいカラムを入れる
  def self.ransackable_attributes(auth_object = nil)
    [ "body", "breed_id", "updated_at" ]
  end

  scope :similar_to, ->(embedding, limit = 5) {
    where.not(embedding: nil)
      .order(Arel.sql("embedding <-> '#{embedding}'"))
      .limit(limit)
  }

  private

  def enqueue_embedding_job
    GenerateQuestionEmbeddingJob.perform_later(id)
  end
end
