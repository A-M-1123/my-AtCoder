s = gets.chomp.to_i
n = []
n[1] = s
i = 2
res = 0
 
while true
  if n[i - 1] % 2 == 0
    n[i] = n[i - 1] / 2
  else
    n[i] = 3 * n[i - 1] + 1
  end
  
  for j in 1..(i - 1)
    if n[i] == n[j]
      res = i
      break
    end
  end
  
  if res != 0
    puts res
    break
  end
  
  i += 1
end