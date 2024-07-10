t = gets.to_i
for i in 1..t
  n,k = gets.chomp.split.map(&:to_i)
  n4d = n.to_s(3).split("").map(&:to_i)
  cnt = 0
  n4d.each{|d| cnt += d}
  if cnt <= k && (k-n) % 2 == 0
    puts "Yes"
  else
    puts "No"
  end
end