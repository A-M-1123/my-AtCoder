n = gets.to_i
l = gets.split.map(&:to_i)

if n < 3
  puts 0
  exit
end

cnt = 0
for i in 0..(n-3)
  for j in (i+1)..(n-2)
    for k in (j+1)..(n-1)
      ls = [l[i],l[j],l[k]]
      ls.sort!
      if ls[0]+ls[1] > ls[2] && ls[0] != ls[1] && ls[1] != ls[2]
        cnt += 1
      end
    end
  end
end
puts cnt