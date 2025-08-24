class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :question_answers, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_one_attached :icon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
