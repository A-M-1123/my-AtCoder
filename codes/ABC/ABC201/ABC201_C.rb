def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

s = getChars

cir = que = 0
ns = Array.new(10,0)
for i in 0..9
  if s[i] == "o"
    ns[i] = 1
    cir += 1
  elsif s[i] == "?"
    ns[i] = 2
    que += 1
  end
end

if cir > 4 || (cir+que) == 0
  puts 0
else
  ans = 0
  for i in 0..9
    for j in 0..9
      for k in 0..9
        for l in 0..9
          num = [i,j,k,l]
          ck = Array.new(10,0)
          num.each{|e| ck[e] = 1}
          flag = 1
          for m in 0..9
            if ns[m] == 1 && ck[m] < 1
              flag = 0
              break
            elsif ns[m] == 0 && ck[m] > 0
              flag = 0
              break
            end
          end
          ans += 1 if flag == 1
        end
      end
    end
  end
  puts ans
end
  