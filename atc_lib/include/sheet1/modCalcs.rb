def modInv(a, mod)
    b = mod
    u = 1
    v = 0
    while 0 < b
        t = a/b
        a -= t*b
        a,b = b,a
        u -= t*v
        u,v = v,u
    end
    u %= mod
    u += mod if u < 0
    return u
end
def fracMod(nu, de, mod)
    nu %= mod
    return nu * modInv(de,mod) % mod
end
def powMod(b, e, mod)
    res = 1
    while 0 < e
        res = (res*b) % mod if e & 1 > 0
        b = (b*b) % mod
        e = e >> 1
    end
    return res
end
def combMod(n, k, mod)
    return 1 if k < 1 || n <= k
    nu = de = 1
    i = 1
    while i <= k
        nu = nu*(n-i+1) % mod
        de = de*i % mod
        i += 1
    end
    return nu*powMod(de, mod-2, mod) % mod
end


def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
