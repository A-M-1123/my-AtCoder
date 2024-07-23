k = gets.to_i
s = gets.chomp.split("")

if s.length <= k
  puts s.join
else
  for i in 0..(k-1)
    print s[i]
  end
  puts "..."
end