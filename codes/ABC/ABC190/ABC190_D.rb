n = gets.to_i
n *= 2

ans = 0
for div in 1..((n**0.5).to_i)
  if n % div == 0
    ln = n / div
    if (ln - (div+1)) % 2 == 0
      ans += 2
    end
  end
end
puts ans
