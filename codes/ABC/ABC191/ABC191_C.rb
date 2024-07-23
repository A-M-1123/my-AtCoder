B = "#"
W = "."

h,w = gets.split.map(&:to_i)
s = h.times.map{gets.chomp.split("")}

ans = 0
for i in 0..(h-2)
  for j in 0..(w-2)
    cnt = 0
    pos = [[i,j],[i,j+1],[i+1,j],[i+1,j+1]]
    for k in 0..3
      cnt += 1 if s[pos[k][0]][pos[k][1]] == B
    end
    ans += 1 if cnt == 1 || cnt == 3
  end
end
puts ans
