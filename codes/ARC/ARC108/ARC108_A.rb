s,p = gets.split.map(&:to_i)

flag = 0
for ni in 1..(p**0.5).to_i
  if ni*(s-ni) == p
    flag = 1
    break
  end
end
if flag == 1
  puts "Yes"
else
  puts "No"
end