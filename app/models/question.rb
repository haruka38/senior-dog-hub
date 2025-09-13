class Question < ApplicationRecord
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

  def self.ransackable_associations(auth_object = nil)
    [ "breed", "question_tags", "tags" ]
  end

  # ransackで検索したいカラムを入れる
  def self.ransackable_attributes(auth_object = nil)
    [ "body", "breed_id", "updated_at" ]
  end
end
