class BIT
    def initialize(arr)
        @defVal = 0  # sum
        @arrLen = arr.length
        @trDepth = (@arrLen-1).bit_length
        @trLen = (1 << @trDepth) + 1
        @tree = initTree(arr)
    end
    def initTree(arr)
        tr = Array.new(@trLen,@defVal)
        i = -1
        while (i += 1) < @trLen-1
            tr[i+1] = calc(tr[i+1], (arr[i]||0))  # calc
            tr[getParent(i+1)] = calc(tr[getParent(i+1)], tr[i+1]) if i+1 < @trLen-1  # calc
        end
        return tr
    end

    def query(tarL,tarR)
        return nil if tarL > tarR
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        return invCalc(calcQuery(tarR+1),calcQuery(tarL))  # calc
    end
    def calcQuery(r)
        ret = @defVal
        while 0 < r
            ret = calc(ret,@tree[r])  # calc
            r -= calcLowestBit(r)
        end
        return ret
    end
    
    def update(id,d)
        return false if id < 0 || @arrLen <= id
        calcUpdate(id+1,d)
    end
    def calcUpdate(i,d)
        while i && i < @trLen
            @tree[i] = calc(@tree[i],d)  # calc
            i = getParent(i)
        end
    end

    def calc(x,y)
        return x+y  # sum
    end
    def invCalc(x,y)
        return calc(x,@defVal-y)  # sum
    end

    def getParent(id)
        return nil if id <= 0 || @trLen-1 <= id
        return id + calcLowestBit(id)
    end
    def calcLowestBit(n)
        return nil if n <= 0
        return n - (n & (n-1))
    end

    def show()
        s = Array.new(@trDepth+1).map{Array.new(0)}
        i = 0
        while (i += 1) <= @trLen
            dep = calcLowestBit(i).bit_length-1
            fil = '-'*(@tree[i].to_s.length)
            j = 0-1
            while (j += 1) <= @trDepth
              s[j] << ((j==dep)?(@tree[i]):(fil))
            end
        end
        i = @trDepth+1
        while (i -= 1) >= 0
            puts s[i].join(' ')
        end
    end
end


class BIT
    def initialize(arr); @defVal=0; @arrLen=arr.length; @trDepth=(@arrLen-1).bit_length; @trLen=(1<<@trDepth)+1; @tree=initTree(arr); end
    def initTree(arr); tr=Array.new(@trLen,@defVal); i=-1; while (i+=1)<@trLen-1; tr[i+1]=calc(tr[i+1],(arr[i]||0)); tr[getParent(i+1)]=calc(tr[getParent(i+1)],tr[i+1]) if i+1<@trLen-1; end; return tr; end

    def query(tarL,tarR); return nil if tarL>tarR; tarL=0 if tarL<0; tarR=@arrLen-1 if @arrLen<=tarR; return invCalc(calcQuery(tarR+1),calcQuery(tarL)); end;  def calcQuery(r); ret=@defVal; while 0<r; ret=calc(ret,@tree[r]); r-=calcLowestBit(r); end; return ret; end
    def update(id,d); return false if id<0 || @arrLen<=id; calcUpdate(id+1,d); end;  def calcUpdate(i,d); while i && i<@trLen; @tree[i]=calc(@tree[i],d); i=getParent(i); end; end

    def calc(x,y); return x+y; end
    def invCalc(x,y); return calc(x,@defVal-y); end
    def show(); s=Array.new(@trDepth+1).map{Array.new(0)}; i=0; while (i+=1) <= @trLen; dep=calcLowestBit(i).bit_length-1; fil = '-'*(@tree[i].to_s.length); j=0-1; while (j+=1) <= @trDepth; s[j] << ((j==dep)?(@tree[i]):(fil)); end; end; i=@trDepth+1; while (i-=1) >= 0; puts s[i].join(' '); end; end;  def getParent(id); return nil if id<=0 || @trLen-1<=id; return id+calcLowestBit(id); end;  def calcLowestBit(n); return nil if n<=0; return n-(n&(n-1)); end
end
