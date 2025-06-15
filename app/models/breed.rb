class Breed < ApplicationRecord
  validates :name, length: { maximum: 32 }, allow_blank: true

  has_many :questions, dependent: :nullify
  # dependent: :nullifyで、breedが削除されてもquestionは残り、breedにはnullが入る
end
