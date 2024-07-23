we = ["Sunny", "Cloudy", "Rainy"]
s = gets.chomp
id = 0
for i in 0..2
  id = i if we[i] == s
end
puts we[(id+1)%3]