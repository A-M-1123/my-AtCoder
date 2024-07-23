a, b, x = gets.split.map(&:to_f)

if x <= a*a*b/2.0
  l = x*2.0/(a*b)
  tann = Math.atan(b/l)
  puts tann/(Math::PI)*180.0
else
  l = (x*1.0-(a*a*b/2.0))*2.0/(a*a)
  tann = Math.atan((b-l)/a)
  puts tann/(Math::PI)*180.0
end