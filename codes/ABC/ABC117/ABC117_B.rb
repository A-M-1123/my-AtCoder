n = gets.chomp.to_i
num = gets.chomp.split
max = 0
sum = 0

for i in 0..(n-1)
  num[i] = num[i].to_i
  if max < num[i]
    max = num[i]
  end
  sum += num[i]
end
sum -= max
if max < sum
  puts "Yes"
else
  puts "No"
end
  