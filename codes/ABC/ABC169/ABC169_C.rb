require 'bigdecimal'
require 'bigdecimal/util'

a,b = gets.split
a = a.to_d
b = b.to_d
b1 = b.to_i.to_s.to_d
b2 = b-b1

if a*b == 0
  puts 0
else
  tmp1 = a*b1
  tmp2 = a*b2
  puts (tmp1+tmp2).to_i
end