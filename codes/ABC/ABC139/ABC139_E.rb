n = gets.to_i
a = Array.new(n+1)
for i in 1..n
  a[i] = gets.split.map(&:to_i)
end

ids = Array.new(n+1, 0)
days = 0
flag = 0
preid = Array.new(0)
continue = 1
while continue == 1
  flag = 0
  incid = Hash.new(0)
  if days == 0
    for i in 1..n
      if ids[i] <= n-2
        if a[a[i][ids[i]]][ids[a[i][ids[i]]]] == i
          flag = 1
          incid[i] += 1
        end
      end
    end
  else
    preid.each do |id|
      if ids[id] <= n-2
        if a[a[id][ids[id]]][ids[a[id][ids[id]]]] == id
          flag = 1
          incid[id] += 1
          incid[a[id][ids[id]]] += 1
        end
      end
    end
  end   
  days += 1
  preid = []
  if flag == 0
    break
  else
    incid.each do |k,v|
      ids[k] += 1
      preid.push(k)
    end
    for i in 1..n
      if ids[i] <= n-2
        break
      end
      if i == n
        continue = 0
      end
    end
  end
end

if flag == 0
  puts -1
else
  puts days
end