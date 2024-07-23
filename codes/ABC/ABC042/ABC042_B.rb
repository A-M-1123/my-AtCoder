n, l = gets.chomp.split.map(&:to_i)
s = Array.new(n, Array.new(l))
for i in 0..(n-1)
  s[i] = gets.chomp
end
s.sort!
puts s.join