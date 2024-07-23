n = gets.to_i

a1 = []
a2 = []
for d in 1..(n**0.5).to_i
  if n % d == 0
    a1.push(d)
    a2.push(n/d)
  end
end

a1.each{|e| puts e}
puts a2[-1] if a1[-1] != a2[-1]
for i in 2..a2.length
  puts a2[-1*i]
end
