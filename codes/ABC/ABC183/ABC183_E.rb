MOD = 10**9+7
h,w = gets.split.map(&:to_i)
s = h.times.map{gets.chomp.split("")}

ssx = Array.new(h).map{Array.new(w,0)}
ssy = Array.new(h).map{Array.new(w,0)}
ssc = Array.new(h).map{Array.new(w,0)}
cnts = Array.new(h).map{Array.new(w,0)}

cnts[0][0] = 1

for i in 0..(h-1)
  for j in 0..(w-1)
    if s[i][j] == "."
      if j > 0 && s[i][j-1] == "."
        cnts[i][j] = (cnts[i][j] + ssx[i][j-1]) % MOD
      end
      if i > 0 && s[i-1][j] == "."
        cnts[i][j] = (cnts[i][j] + ssy[i-1][j]) % MOD
      end
      if i > 0 && j > 0 && s[i-1][j-1] == "."
        cnts[i][j] = (cnts[i][j] + ssc[i-1][j-1]) % MOD
      end
      
      if j < 1 || s[i][j-1] == "#"
        ssx[i][j] = cnts[i][j] % MOD
      else
        ssx[i][j] = (ssx[i][j-1] + cnts[i][j]) % MOD
      end
      if i < 1 || s[i-1][j] == "#"
        ssy[i][j] = cnts[i][j] % MOD
      else
        ssy[i][j] = (ssy[i-1][j] + cnts[i][j]) % MOD
      end
      if i < 1 || j < 1 || s[i-1][j-1] == "#"
        ssc[i][j] = cnts[i][j] % MOD
      else
        ssc[i][j] = (ssc[i-1][j-1] + cnts[i][j]) % MOD
      end
    end
  end
end

puts cnts[h-1][w-1] % MOD