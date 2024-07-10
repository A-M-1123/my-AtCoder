def getDigitLen(n)
    n = n.abs
    return 1 if n == 0
    return Math.log10(n).to_i + 1
end
def getNumApart(n)
    d = []
    begin
        d.unshift(n % 10)
        n /= 10
    end while n > 0
    return d
end

def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
# getDigitLen(num) getNumApart(num) ex.4275->[4,2,7,5]
