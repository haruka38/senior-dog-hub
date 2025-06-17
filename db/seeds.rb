# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

breeds =Breed.create!(
    [
      { name: "柴犬" },
      { name: "トイプードル" },
      { name: "スタンダードプードル" },
      { name: "ラブラドール" },
      { name: "ミックス" }
    ]
  )

10.times do |i|
  Question.create!(
    nickname: "匿名#{i+1}さん",
    age: rand(7..17),
    body: "シニア犬についての質問#{i+1}です。",
    breed: breeds.sample
    # breedをランダムで割り当てる
    
end
