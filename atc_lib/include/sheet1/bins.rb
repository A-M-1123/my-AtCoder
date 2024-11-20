def binsJust(a,t,l,r)
    return nil if t < a[l] || a[r] < t
    while l <= r
        m = (l+r)/2
        return m if a[m] == t
        (a[m]<t) ? (l=m+1):(r=m-1)
    end
    return nil
end

# t <= a[m] を満たす最小のm
def binsJustOver(a,t,n)
    return nil if a[-1] < t
    l,r = 0,n
    while l < r
        m = (l+r)/2
        (a[m]<t) ? (l=m+1):(r=m)
    end
    return l
end

# t < a[m] を満たす最小のm
def binsOver(a,t,n)
    return nil if a[-1] <= t
    l,r = 0,n
    while l < r
        m = (l+r)/2
        (a[m]<=t) ? (l=m+1):(r=m)
    end
    return l
end

# a[m] <= t を満たす最大のm
def binsJustUnder(a,t,n)
    return nil if t < a[0]
    l,r = 0,n-1; rm=0
    while l <= r
        m = (l+r)/2
        (a[m]<=t) ? (l=m+1; rm=m if rm<m):(r=m-1)
    end
    return rm
end

# a[m] < t を満たす最大のm
def binsUnder(a,t,n)
    return nil if t <= a[0]
    l,r = 0,n-1; rm=0
    while l <= r
        m = (l+r)/2
        (a[m]<t) ? (l=m+1; rm=m if rm<m):(r=m-1)
    end
    return rm
end

def binsJust(a,t,l,r);return nil if t<a[l]||a[r]<t;while l<=r;m=(l+r)/2;return m if a[m]==t;(a[m]<t)?(l=m+1):(r=m-1);end;return nil;end; def binsJustOver(a,t,n);return nil if a[-1]<t;l,r=0,n;while l<r;m=(l+r)/2;(a[m]<t)?(l=m+1):(r=m);end;return l;end; def binsOver(a,t,n);return nil if a[-1]<=t;l,r=0,n;while l<r;m=(l+r)/2;(a[m]<=t)?(l=m+1):(r=m);end;return l;end; def binsJustUnder(a,t,n);return nil if t<a[0];l,r=0,n-1;rm=0;while l<=r;m=(l+r)/2;(a[m]<=t)?(l=m+1; rm=m if rm<m):(r=m-1);end;return rm;end; def binsUnder(a,t,n);return nil if t<=a[0];l,r=0,n-1;rm=0;while l<=r;m=(l+r)/2;(a[m]<t)?(l=m+1; rm=m if rm<m):(r=m-1);end;return rm;end
# binsJust & binsJustOver & binsOver & binsJustUnder & binsUnder (array,target,len)
