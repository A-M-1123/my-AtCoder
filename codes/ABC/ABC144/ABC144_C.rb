n = gets.to_i
divs = Array.new(0)
for i in 1..([n, 10**6].min)
  if n % i == 0
    divs.push(i)
  end
end

min = 10**13
divs.each{|d| min = [min, d+(n/d)].min}
puts min-2