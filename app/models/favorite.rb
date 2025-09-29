class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # 同じ投稿を同じユーザーがお気に入り登録できないようにする
  validates :question_id, uniqueness: { scope: :user_id }
end
