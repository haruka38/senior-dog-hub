class QuestionAnswer < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }

  belongs_to :question
end
