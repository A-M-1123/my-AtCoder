def addMargin2DArray(a,c)
	h = a.length
	w = a[0].length
	i = 0
	while i < h
    	a[i].unshift(c)
    	a[i].push(c)
		i += 1
    end
	a.unshift(Array.new(w+2,c))
	a.push(Array.new(w+2,c))
	return a
end

# addMargin2DArray(arr,char)

def addMargin2DArray(a,c);h=a.length;w=a[0].length;i=0;while i<h;a[i].unshift(c);a[i].push(c);i+=1;end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
