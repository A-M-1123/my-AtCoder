n = gets.to_i
flag = 0
for i in 1..9
  if (n % i == 0) && (1 <= n / i) && (n / i <= 9)
    flag = 1
  end
end
flag == 1 ? (puts "Yes"):(puts "No")
    
    