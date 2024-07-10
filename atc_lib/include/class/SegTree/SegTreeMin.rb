class SegTreeMin
    def initialize(arr)
        @defVal = 10**16  # about-min
        @arrLen = arr.length
        @trBtmLen = calcWidth(@arrLen)
        @trLen = @trBtmLen*2-1
        @trBtmStID = @trBtmLen-1
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
            topID = calcTopIDByDepth(dep)
            i = -1
            while (i += 1) < (1 << dep)
                lid,rid = calcChildID(topID+i)
                tr[topID+i] = calculate(tr[lid],tr[rid])  # about-calc
            end
        end
        return tr
    end

    def query(tarL,tarR)
        return nil if tarL > tarR
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        return calcRange(tarL,tarR)
    end
    def calcRange(l,r)
        ret = @defVal
        r += 1
        isClimb = (0 < l)?(true):(false)
        while l < r
            if isClimb
                w = ((1 << l.bit_length) - l) & l
                if w <= r-l
                    ret = calculate(ret,@tree[calcIDByRange(l,w)])  # about-calc
                    l += w
                else
                    isClimb = false
                end
            else
                w = 1 << ((r-l).bit_length - 1)
                ret = calculate(ret,@tree[calcIDByRange(l,w)])  # about-calc
                l += w
            end
        end
        return ret
    end

    def getPoint(id)
        return if id < 0 || @arrLen <= id
        return @tree[@trBtmStID+id]
    end

    def update(id,v)
        return if id < 0 || @arrLen <= id
        id += @trBtmStID
        @tree[id] = v
        lid = (id & 1 == 1)?(id):(id-1)
        while (id = calcParentID(id))
            newV = calculate(@tree[lid],@tree[lid+1])  # about-calc
            if @tree[id] != newV
                @tree[id] = newV
                lid = (id & 1 == 1)?(id):(id-1)
            else
                break
            end
        end
    end

    def calculate(v1,v2)
        return (v1 < v2)?(v1):(v2)  # about-min
    end
    
    def calcWidth(len)
        return 1 if len<2
        return 1 << (len-1).bit_length
    end
    def calcDepth(id)
        return 0 if id<0
        return (id+1).bit_length - 1
    end
    def calcIDByRange(l,w)
        return calcTopIDByDepth(@trDepth+1-w.bit_length) + l/w
    end
    def calcTopIDByDepth(dep)
        return (1 << dep) - 1
    end
    def calcParentID(id)
        return (0 < id)?((id-1)/2):(nil)
    end
    def calcChildID(id)
        return id*2+1,id*2+2
    end
end


# calss セグ木(最小値) // SegTreeMin.new(array), update(id,v)...vで上書き
class SegTreeMin
    def initialize(arr); @defVal = 10**16; @arrLen=arr.length; @trBtmLen=calcWidth(@arrLen); @trLen=@trBtmLen*2-1; @trBtmStID=@trBtmLen-1; @trBtmEnID=@trBtmStID+@arrLen-1; @trDepth=calcDepth(@trBtmStID); @tree=initTree(arr); end;  def initTree(arr); tr=Array.new(@trLen,@defVal); i = -1; while (i += 1)<@arrLen; tr[i+@trBtmStID]=arr[i]; end; dep=@trDepth; while (dep -= 1)>=0; topID=calcTopIDByDepth(dep); i = -1; while (i+=1) < (1 << dep); lid,rid=calcChildID(topID+i); tr[topID+i]=calculate(tr[lid],tr[rid]); end; end; return tr; end
    def query(tarL,tarR); return nil if tarL>tarR; tarL=0 if tarL<0; tarR=@arrLen-1 if @arrLen<=tarR; return calcRange(tarL,tarR); end;  def calcRange(l,r); ret=@defVal; r+=1; isClimb = (0 < l)?(true):(false); while l<r; if isClimb; w=(((1 << l.bit_length) - l)&l); if w<=r-l; ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; else; isClimb=false; end; else; w = 1 << ((r-l).bit_length-1); ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; end; end; return ret; end
    def getPoint(id); return if id<0 || @arrLen<=id; return @tree[@trBtmStID+id]; end
    def update(id,v); return if id<0 || @arrLen<=id; id+=@trBtmStID; @tree[id]=v; lid=(id&1 == 1)?(id):(id-1); while (id=calcParentID(id)); newV=calculate(@tree[lid],@tree[lid+1]); if @tree[id]!=newV; @tree[id]=newV; lid=(id&1 == 1)?(id):(id-1); else; break; end; end; end;  def calculate(v1,v2); return (v1<v2)?(v1):(v2); end;  def calcWidth(len); return 1 if len<2; return 1 << (len-1).bit_length; end;  def calcDepth(id); return 0 if id<0; return (id+1).bit_length-1; end;  def calcIDByRange(l,w); return calcTopIDByDepth(@trDepth+1-w.bit_length)+l/w; end;  def calcTopIDByDepth(dep); return (1 << dep)-1; end;  def calcParentID(id); return (0 < id)?((id-1)/2):(nil); end;  def calcChildID(id); return id*2+1,id*2+2; end
end
