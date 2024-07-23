a, b = gets.split.map(&:to_i)
a <= 9 && b <= 9 ? (puts a*b):(puts -1)