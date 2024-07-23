n, k, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
sum = 0
a.each{|an| sum += an}
pt = m*n - sum
if pt > k
  puts -1
else
  if pt > 0
    puts pt
  else
    puts 0
  end
end
