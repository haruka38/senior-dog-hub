class QuestionAnswer < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  has_many :stamps, as: :stampable, dependent: :destroy

  belongs_to :question
  belongs_to :user, optional: true
end
