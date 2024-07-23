def caesar(ch, num)
    if (ch.ord-('A').ord) + num >= 26
      num -= 26
    end
    return (ch.ord + num).chr
  end
  
  n = gets.to_i
  s = gets.chomp.split("")
  s.each {|c| print caesar(c, n)}
  puts ""