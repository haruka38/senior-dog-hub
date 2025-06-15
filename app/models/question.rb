class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 65_535 }
  validates :nickname, length: { maximum: 32 }, allow_blank: true
  validates :age, numericality: { only_integer: true }, allow_blank: true

  belongs_to :breed
end
