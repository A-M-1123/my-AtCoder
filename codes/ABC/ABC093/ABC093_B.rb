a, b, k = gets.split.map(&:to_i)

for i in 0..(k-1)
  puts a+i if a+i <= b
end
if a+k-1 <= b
  for i in [b-k+1, a+k].max..b
    puts i
  end
end