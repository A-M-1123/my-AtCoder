n,k = gets.split.map(&:to_i)

for i in 1..k
  if n % 200 == 0
    n /= 200
  else
    n *= 1000
    n += 200
  end
end
puts n