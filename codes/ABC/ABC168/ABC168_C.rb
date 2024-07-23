include Math
a,b,h,m = gets.split.map(&:to_i)

ax = a*cos(PI*(h+m/60.0)/6.0)
ay = a*sin(PI*(h+m/60.0)/6.0)
bx = b*cos(PI*m/30.0)
by = b*sin(PI*m/30.0)

puts (((ax-bx).abs)**2 + ((ay-by).abs)**2)**0.5