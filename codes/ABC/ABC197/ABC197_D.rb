require 'bigdecimal'
require 'bigdecimal/util'
n = gets.to_d
x0, y0 = gets.split.map(&:to_i)
xn, yn = gets.split.map(&:to_i)

x0 *= 100000000
y0 *= 100000000
xn *= 100000000
yn *= 100000000

xc = (x0+xn)/2.0
yc = (y0+yn)/2.0
r = ((x0-xn)**2.0 + (y0-yn)**2.0)**0.5 / 2

x1 = r*Math.cos(Math.acos((x0-xc)/r)+2*Math::PI/n) + xc
y1 = r*Math.sin(Math.asin((y0-yc)/r)+2*Math::PI/n) + yc

puts "#{x1/100000000.0} #{y1/100000000.0}"