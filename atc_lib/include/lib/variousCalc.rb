def nC2(n)
    return 0 if n < 2
    return n*(n-1)/2
end

def sumStep(n)
    return 0 if n < 1
    return n*(n+1)/2
end

def count0011(w,i)
    blc = n/(w<<1)
    ret = blc*w
    n -= blc*(w<<1)+w-1
    ret += n if 0 < n
    return ret
end

# nCn(n) # sumStep(n) <sum(1..n)> # count0011(w,i) <0-index>
def nC2(n); return 0 if n<2; return n*(n-1)/2; end;  def sumStep(n); return 0 if n<1; return n*(n+1)/2; end;  def count0011(w,i); blc = n/(w << 1); ret = blc*w; n -= blc*(w << 1)+w-1; ret+=n if 0<n; return ret; end
