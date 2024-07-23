x = gets.split.map(&:to_i)
for i in 0..4
  if x[i] == 0
    puts i+1
    break
  end
end
