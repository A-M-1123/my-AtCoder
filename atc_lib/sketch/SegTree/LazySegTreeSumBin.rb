class LazySegTreeSum
    def initialize(arr)
        @defVal = 0  # about-sum
        @arrLen = arr.length
        @trBtmLen = calcBtmWidth(@arrLen)
        @trLen = @trBtmLen*2
        @trBtmStID = @trBtmLen
        @trBtmEnID = @trBtmStID+@arrLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
        @lazy = Array.new(@trBtmStID,@defVal)
        @queLazy = []
        @queNode = []
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

    def calculate(v1,v2)
        return v1+v2  # about-sum
    end

    def query(tarL,tarR)
        return nil if !isRangeIncluded(tarL,tarR)
        return querySub(@trBtmStID+tarL,@trBtmStID+tarR)
    end
    def querySub(l,r)
        ret = @defVal
        setupQueues(l,r)
        nxt = @queNode.pop
        while (node = @queLazy.pop)
            eval(node)
            if node == nxt
                ret = calculate(ret,@tree[node])
                nxt = @queNode.pop
            end
        end
        return ret
    end
    def setupQueues(l,r)
        highestNodeR = calcHighestNodeR(r)
        prevNode = calcNodeId(l,r,highestNodeR)
        @queNode << prevNode
        l += l / prevNode
        while l <= r
            curNode = calcNodeId(l,r,highestNodeR)
            pushToQueLazy(prevNode,calcBinaryCommonCapital(prevNode,curNode))
            @queNode << curNode
            l += l / curNode
            prevNode = curNode
        end
        pushToQueLazy(prevNode,1)
        @queLazy << 1
    end
    def pushToQueLazy(node,common)
        return if node <= 0 || common < 0
        while common < node
            @queLazy << node
            node >>= 1
        end
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
            return (commonCapital << 1)
        end
    end
    def calcHighestNodeR(r)
        return nil if r <= 0
        ret = r >> countBinaryBottomOnes(r)
        ret = 1 if ret == 0
        return ret
    end

    def updateCalc(tarL,tarR,v)
        return false if !isRangeIncluded(tarL,tarR)

    end

    def isRangeIncluded(l,r)
        return 0 <= l && l <= r && r < @arrLen
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
