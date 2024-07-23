x, y, z, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
ab = Array.new(0)
abc = Array.new(0)
a.each do |ap|
  b.each do |bp|
    ab.push(ap+bp)
  end
end
ab.sort!{|m, n| n <=> m}
for i in 0..[x*y-1, 2999].min
  c.each do |cp|
    abc.push(ab[i]+cp)
  end
end
abc.sort!{|m, n| n <=> m}
for i in 0..(k-1)
  puts abc[i]
end