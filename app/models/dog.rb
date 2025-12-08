class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed, optional: true
  has_one_attached :insurance_image

  enum :disease, {
    no_disease: 0,
    heart: 1,
    kidney: 2,
    eye: 3,
    cancer: 4,
    other: 99
  }

  def age
    return nil unless birthday.present?

    today = Date.today
    age = today.year - birthday.year
    age -= 1 if today < birthday + age.years  # 誕生日がまだ来ていなければ -1

    age
  end
end
