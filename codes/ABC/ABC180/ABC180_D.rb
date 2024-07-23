x,y,a,b = gets.split.map(&:to_i)

ep = 0
while x*a <= x+b && x < y
  x *= a
  ep += 1 if x < y
end

if x >= y
  puts ep
else
  puts ep + (y-x-1)/b
end