h,w,x,y = gets.split.map(&:to_i)
s = h.times.map{gets.chomp.split('')}
x -= 1
y -= 1

ans = 1
xi = x
yi = y
while 0 < xi
  xi -= 1
  if s[xi][y] == '.'
    ans += 1
  else
    break
  end
end
xi = x
while xi < h-1
  xi += 1
  if s[xi][y] == '.'
    ans += 1
  else
    break
  end
end
while 0 < yi
  yi -= 1
  if s[x][yi] == '.'
    ans += 1
  else
    break
  end
end
yi = y
while yi < w-1
  yi += 1
  if s[x][yi] == '.'
    ans += 1
  else
    break
  end
end
puts ans