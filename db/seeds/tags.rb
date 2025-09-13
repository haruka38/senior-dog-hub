[ "食事", "散歩", "睡眠", "疾患" ].each do |name|
  Tag.find_or_create_by!(name: name)
end
