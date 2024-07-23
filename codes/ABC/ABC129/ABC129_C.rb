MOD = 1000000007
n, m = gets.split.map(&:to_i)
a = m.times.map{gets.to_i} if m > 0

spls = Array.new(0)
fib = Array.new(n+1)
fib[0] = fib[1] = 1
for i in 2..n
  fib[i] = fib[i-1] + fib[i-2]
end

flag = 0
if m > 0
  for i in 0..(m-1)
    if i == 0
      if a[i] == 1
        spls.push(1)
      else
        spls.push(a[i] - 1)
      end
    else
      if a[i] - a[i-1] == 1
        flag = 1
        break
      else
        spls.push(a[i] - a[i-1] - 2)
      end
    end
  end
  if n - a[i] > 1
    spls.push(n - a[i] - 1)
  end
else
  spls.push(n)
end

ans = 1
if flag > 0
  puts 0
else
  spls.each do |sp|
    ans = (ans*fib[sp]) % MOD
  end
  puts ans
end