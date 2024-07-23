require 'bigdecimal'
require 'bigdecimal/util'

def div10k(n)
  return (n/10000.0).to_i
end

x,y,r = gets.split.map(&:to_d)
x *= 10000
x = x.to_i
y *= 10000
y = y.to_i
r *= 10000
r = r.to_i

maxx = div10k(x+r)
minx = div10k(x-r)
minx += 1 if minx*10000 < x-r

ans = 0
for i in 0..(maxx-minx)
  xi = (maxx-i)*10000
  rt = Math.sqrt(r**2 - (x-xi)**2)
  y0 = div10k(rt + y)
  y1 = -rt + y
  (div10k(y1)*10000 >= y1) ? (y1 = div10k(y1)):(y1 = div10k(y1)+1)
  if y0 >= y1
    ans += y0 - y1 + 1
  end
end
puts ans
