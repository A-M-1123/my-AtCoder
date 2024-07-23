N, M, X, Y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
ifwar = 1
for i in (X+1)..Y
  ok = 1
  a.each do |ax|
    if ax >= i
      ok = 0
      break
    end
  end
  if ok == 1
    b.each do |by|
      if by < i
        ok = 0
        break
      end
    end
  end
  if ok == 1
    ifwar = 0
    break
  end
end
if ifwar == 0
  puts "No War"
else
  puts "War"
end