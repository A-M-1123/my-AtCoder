n = gets.to_i
a,b = n.times.map{gets.split.map(&:to_i)}.transpose
a.sort!
b.sort!

if n % 2 == 1
  puts b[n/2]-a[n/2]+1
else
  am = (a[n/2]+a[n/2-1])/2.0
  bm = (b[n/2]+b[n/2-1])/2.0
  puts ((bm-am)*2+1).to_i
end