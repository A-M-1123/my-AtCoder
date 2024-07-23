n = gets.split("").map(&:to_i)
cat = 0
t2 = n[0] * 10 + n[1]
e2 = n[2] * 10 + n[3]
if 1 <= t2 && t2 <= 12 && 1 <= e2 && e2 <= 12
  puts "AMBIGUOUS"
elsif 1 <= t2 && t2 <= 12
  puts "MMYY"
elsif 1 <= e2 && e2 <= 12
  puts "YYMM"
else
  puts "NA"
end
  