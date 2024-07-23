num = gets.chomp.to_i
money = 0.0
for i in 1..num
  n = gets.chomp.split
  n[0] = n[0].to_f
  if n[1] == "JPY"
    money += n[0]
  else
    money += (n[0] * 380000.0)
  end
end
puts money