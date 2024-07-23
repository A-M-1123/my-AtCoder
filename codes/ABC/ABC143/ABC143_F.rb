n = gets.to_i
a = gets.split.map(&:to_i)
ns = Hash.new(0)
a.each{|an| ns[an] += 1}
cnt = Array.new(n+1, -1)

for i in 1..n
  if cnt[i] == -1
    if ns.length < i
      cnt[i] = 0
    elsif i > 1
      cnt[i] = 0
      tmp = ns.dup
      tmpcnt = 0
      while tmp.length >= i
        tmp.each do |k,v|
          v -= 1
          tmpcnt += 1
          tmp.delete(k) if v <= 0
        end
        #puts "i:#{i}, tmp:#{tmpcnt}"
        if tmpcnt < i
          break
        else
          
          cnt[i] += tmpcnt / i
          tmpcnt %= i
        end
      end
    else
      cnt[i] = n
    end
  end
end
for i in 1..n
  puts cnt[i]
end