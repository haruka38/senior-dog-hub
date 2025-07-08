class Stamp < ApplicationRecord
  belongs_to :user, optional: true
  # optional: trueでnullでもエラーにならない
  belongs_to :stamp_type
  belongs_to :stampable, polymorphic: true
  # polymorphicでstampモデルをquestionでもfeelingでも使える
end
