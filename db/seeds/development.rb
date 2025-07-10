puts "🧪 ダミー質問データを作成中..."

breeds = Breed.all.to_a

10.times do |i|
  Question.create!(
    nickname: "匿名#{i + 1}さん",
    age: rand(7..17),
    body: "シニア犬についての質問#{i + 1}です。",
    breed: breeds.sample
  )
end

puts "✅ ダミー質問データの作成完了！"
