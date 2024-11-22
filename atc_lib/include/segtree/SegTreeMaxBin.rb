class SegTreeMax
    def initialize(arr)
        @defVal = -10**16  # about-max
        @arrLen = arr.length
        @trBtmLen = calcBtmWidth(@arrLen)
        @trLen = @trBtmLen*2
        @trBtmStID = @trBtmLen
        @trBtmEnID = @trBtmStID+@arrLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
    end
    def initTree(arr)
        tr = Array.new(@trLen,@defVal)
        i = -1
        while (i += 1) < @arrLen
            tr[i+@trBtmStID] = arr[i]
        end
        dep = @trDepth
        while (dep -= 1) >= 0
            id = (1 << dep) - 1
            endID = (1 << (dep+1)) - 1
            while (id += 1) <= endID
                lid,rid = calcChildID(id)
                tr[id] = calculate(tr[lid],tr[rid])  # about-calc
            end
        end
        return tr
    end

    # 0 <= tarL <= tarR < @arrLen
    def query(tarL,tarR)
        return nil if !(0 <= tarL && tarL <= tarR && tarR < @arrLen)
        return querySub(@trBtmStID+tarL,@trBtmStID+tarR)
    end
    # @trBtmStID <= l <= r < @trBtmStID+@arrLen
    def querySub(l,r)
        ret = @defVal
        highestNodeR = calcHighestNodeR(r)
        while l <= r
            curNode = calcNodeId(l,r,highestNodeR)
            l += l / curNode
            ret = calculate(ret,@tree[curNode])  # about-calc
        end
        return ret
    end
    def calcNodeId(l,r,highestNodeR=nil)
        return nil if l > r
        return l if l == r
        highestNodeR = calcHighestNodeR(r) if !highestNodeR
        highestNodeL = l >> countBinaryBottomZeros(l)
        commonCapital = calcBinaryCommonCapital(l,r)
        if commonCapital < highestNodeL
            return highestNodeL
        elsif commonCapital == highestNodeR
            return commonCapital
        else
            return commonCapital << 1
        end
    end
    def calcHighestNodeR(r)
        return nil if r <= 0
        ret = r >> countBinaryBottomOnes(r)
        ret = 1 if ret == 0
        return ret
    end

    def getPoint(id)
        return nil if id < 0 || @arrLen <= id
        return @tree[@trBtmStID+id]
    end
    
    def updateCalc(id,v)
        return false if id < 0 || @arrLen <= id
        id += @trBtmStID
        preV = @tree[id]
        newV = calculate(preV,v)
        return if preV == newV
        @tree[id] = newV
        updateSub(calcParentID(id))
    end
    def updateOW(id,v)
        return false if id < 0 || @arrLen <= id
        id += @trBtmStID
        @tree[id] = v
        updateSub(calcParentID(id))
    end
    def updateSub(id)
        while 0 < id
            preV = @tree[id]
            lid,rid = calcChildID(id)
            newV = calculate(@tree[lid],@tree[rid])
            return if preV == newV
            @tree[id] = newV
            id = calcParentID(id)
        end
    end

    def calculate(v1,v2)
        return (v1 > v2)?(v1):(v2)  # about-max
    end

    def countBinaryBottomZeros(n)
        return nil if n < 0
        return 1 if n == 0
        return (n^(n-1)).bit_length - 1
    end
    def countBinaryBottomOnes(n)
        return nil if n < 0
        return (n^(n+1)).bit_length - 1
    end
    def calcBinaryCommonCapital(a,b)
        a,b = b,a if b < a
        return nil if a < 0
        return 0 if a == 0
        lenD = b.bit_length - a.bit_length
        a <<= lenD if 0 < lenD
        return a >> (a^b).bit_length
    end
    def calcBtmWidth(len)
        return 1 if len < 2
        return 1 << (len-1).bit_length
    end
    def calcDepth(id)
        return nil if id <= 0
        return (id-1).bit_length
    end
    def calcParentID(id)
        return id >> 1
    end
    def calcChildID(id)
        return id*2,id*2+1
    end
end
# class SegTreeMax.new(array) query(l,r) updateCalc/OW(id,value)



class SegTreeMax
    def initialize(arr);@defVal = -10**16; @arrLen=arr.length;@trBtmLen=calcBtmWidth(@arrLen);@trLen=@trBtmLen*2;@trBtmStID=@trBtmLen;@trBtmEnID=@trBtmStID+@arrLen-1;@trDepth=calcDepth(@trBtmStID);@tree=initTree(arr);end; def initTree(arr);tr=Array.new(@trLen,@defVal);i=-1;while (i+=1)<@arrLen;tr[i+@trBtmStID]=arr[i];end;dep=@trDepth;while (dep-=1)>=0;id=(1 << dep)-1;endID=(1<<(dep+1))-1;while (id+=1)<=endID;lid,rid=calcChildID(id);tr[id]=calculate(tr[lid],tr[rid]);end;end;return tr;end
    def query(tarL,tarR);return nil if !(0<=tarL&&tarL<=tarR&&tarR<@arrLen);return querySub(@trBtmStID+tarL,@trBtmStID+tarR);end; def querySub(l,r);ret=@defVal;highestNodeR=calcHighestNodeR(r);while l<=r;curNode=calcNodeId(l,r,highestNodeR);l+=l/curNode;ret=calculate(ret,@tree[curNode]);end;return ret;end; def calcNodeId(l,r,highestNodeR=nil);return nil if l>r;return l if l==r;highestNodeR=calcHighestNodeR(r) if !highestNodeR;highestNodeL = l >> countBinaryBottomZeros(l);commonCapital=calcBinaryCommonCapital(l,r);if commonCapital<highestNodeL;return highestNodeL;elsif commonCapital==highestNodeR;return commonCapital;else;return commonCapital << 1;end;end; def calcHighestNodeR(r);return nil if r<=0;ret = r >> countBinaryBottomOnes(r);ret=1 if ret==0;return ret;end
    def getPoint(id);return nil if id<=0||@arrLen<id;return @tree[@trBtmStID+id];end
    def updateCalc(id,v);return false if id<=0||@arrLen<id;id+=@trBtmStID;preV=@tree[id];newV=calculate(preV,v);return if preV==newV;@tree[id]=newV;updateSub(calcParentID(id));end
    def updateOW(id,v);return false if id<=0||@arrLen<id;id+=@trBtmStID;@tree[id]=v;updateSub(calcParentID(id));end; def updateSub(id);while 0<id;preV=@tree[id];lid,rid=calcChildID(id);newV=calculate(@tree[lid],@tree[rid]);return if preV==newV;@tree[id]=newV;id=calcParentID(id);end;end
    def calculate(v1,v2);return (v1 > v2)?(v1):(v2);end; def countBinaryBottomZeros(n);return nil if n<0;return 1 if n==0;return (n^(n-1)).bit_length-1;end; def countBinaryBottomOnes(n);return nil if n<0;return (n^(n+1)).bit_length-1;end; def calcBinaryCommonCapital(a,b);a,b=b,a if b<a;return nil if a<0;return 0 if a==0;lenD=b.bit_length-a.bit_length;a<<=lenD if 0<lenD;return a>>(a^b).bit_length;end; def calcBtmWidth(len);return 1 if len<2;return 1<<(len-1).bit_length;end; def calcDepth(id);return nil if id<=0;return (id-1).bit_length;end; def calcParentID(id);return id>>1;end; def calcChildID(id);return id*2,id*2+1;end
end
# class SegTreeMax.new(array) query(l,r) updateCalc/OW(id,value)
