a, b, k = gets.split.map(&:to_i)

if a >= k
  puts "#{a-k} #{b}"
else
  if a+b >= k
  	puts "0 #{b-k+a}"
  else
  	puts "0 0"
  end
end