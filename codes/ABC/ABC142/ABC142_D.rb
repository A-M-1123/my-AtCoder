require 'prime'
a, b = gets.split.map(&:to_i)

divs = Array.new(0)
for i in 1..10**6
  break if a < i && b < i
  divs.push(i) if a % i == 0 && b % i == 0
  divs.push(a/i) if a % i == 0 && b % (a/i) == 0
  divs.push(b/i) if b % i == 0 && a % (b/i) == 0
end
divs.uniq!
#puts divs.join(" ")
cnt = 0
for i in 0..(divs.length-1)
  cnt += 1 if Prime.prime?(divs[i]) || divs[i] == 1
end
puts cnt