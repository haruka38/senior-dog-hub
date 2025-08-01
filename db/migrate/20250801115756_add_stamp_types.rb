class AddStampTypes < ActiveRecord::Migration[8.0]
  def change
    StampType.create!(name: "参考になる", icon: "far fa-lightbulb")
    StampType.create!(name: "いいね", icon: "far fa-thumbs-up")
  end
end
