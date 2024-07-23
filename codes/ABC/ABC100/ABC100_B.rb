d,n = gets.split.map(&:to_i)
if n < 100
  puts 100**d*n
else
  puts 100**(d+1)+100**d
end