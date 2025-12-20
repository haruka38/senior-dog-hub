StampType.find_or_create_by!(name: "それ知りたい") do |s|
  s.icon = "far fa-hand"
end

StampType.find_or_create_by!(name: "わかる") do |s|
  s.icon = "far fa-face-laugh"
end
