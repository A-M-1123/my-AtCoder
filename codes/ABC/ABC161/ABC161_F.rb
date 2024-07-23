n = gets.to_i

cnt = 0

for div in 1..([((n-1)**0.5).to_i, 10**6].min)
  if (n-1) % div == 0
    ns = [div, (n-1)/div].uniq
    ns.each{|num| cnt += 1 if num > 1}
  end
end

for div in 1..([(n**0.5).to_i, 10**6].min)
  if n % div == 0
    ns = [div, n/div].uniq
    ns.each do |num|
      if num > 1
        tmp = n
        while tmp % num == 0
          tmp /= num
        end
        cnt += 1 if tmp % num == 1
      end
    end
  end
end

puts cnt