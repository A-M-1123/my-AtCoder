INF=9999999999999
class PQueVector
    # default : get-Min, isAscend=false : get-Max
    def initialize(vctLen, tarIdx, *isAscend)
        @vctLen = vctLen; @tarIdx = tarIdx
        @arrLen = @len = 0
        (isAscend.empty? || isAscend[0]) ? (@coef=1):(@coef=-1)
        @que = []
    end

    def setArray(arr)
        return if arr.empty?
        @que = Marshal.load(Marshal.dump(arr))
        @arrLen = arr.length; @len = @arrLen
        if @coef < 0
            i = -1
            while (i += 1) < @len
                @que[i][@tarIdx] *= -1
            end
        end
        @que.sort_by!{|v| v[@tarIdx]}
    end

    def getScalar; (0 < @len)?(return @que[0][@tarIdx]*@coef):(return nil); end
    def getVector; (0 < @len)?(return copyCorrectedVector(@que[0])):(return nil); end
    def get2ndScalar
        if @len < 2
            return nil
        elsif @len < 3
            return @que[1][@tarIdx]*@coef
        end
        l,r = @que[1][@tarIdx],@que[2][@tarIdx]
        (l <= r) ? (return l*@coef):(return r*@coef)
    end
    def get2ndVector
        if @len < 2
            return nil
        elsif @len < 3
            return copyCorrectedVector(@que[1])
        end
        l,r = @que[1][@tarIdx],@que[2][@tarIdx]
        (l <= r) ? (tarID=1):(tarID=2)
        return copyCorrectedVector(@que[tarID])
    end

    def pop
        return nil if @len < 1
        if @len == 1
            @len -= 1
            return getCorrectedVector(@que[0])
        end
        res = @que[0]
        @que[0] = @que[@len-1]
        @len -= 1
        i = 0
        curVal = @que[i][@tarIdx]
        while true
            lid,rid = i*2+1,i*2+2
            break if @len <= lid
            rid = lid if @len <= rid
            lVal = @que[lid][@tarIdx]; rVal = @que[rid][@tarIdx]
            if lVal < curVal || rVal < curVal
                (lVal <= rVal) ? (swp=lid):(swp=rid)
                @que[i],@que[swp] = @que[swp],@que[i]
                i = swp
            else
                break
            end
        end
        return getCorrectedVector(res)
    end

    def push(v)
        if @len == @arrLen
            @que << getCorrectedVector(v)
            @len += 1
            @arrLen += 1
        else
            @que[@len] = getCorrectedVector(v)
            @len += 1
        end
        i = @len-1
        while (pid = getParentID(i))
            if @que[i][@tarIdx] < @que[pid][@tarIdx]
                @que[i],@que[pid] = @que[pid],@que[i]
                i = pid
            else
                break
            end
        end
    end

    def getQue; return @que; end
    def getLen; return @len; end

    def getCorrectedVector(vct)
        vct[@tarIdx] *= @coef
        return vct
    end
    def copyCorrectedVector(vct)
        cpyVct = Marshal.load(Marshal.dump(vct))
        return getCorrectedVector(cpyVct)
    end
    def getParentID(cid); (0 < cid)?(return (cid-1)/2):(return nil); end
end
# PQueVector(vectorLength,targetIndex)
# setArray(arr) get/get2nd+Scalar/Vector pop push(v) getQue getLen



class PQueVector
    # default : get-Min, isAscend=false : get-Max
    def initialize(vctLen,tarIdx,*isAscend); @vctLen=vctLen; @tarIdx=tarIdx; @arrLen=@len=0; (isAscend.empty?||isAscend[0])?(@coef=1):(@coef=-1); @que=[]; end
    def setArray(arr); return if arr.empty?; @que=Marshal.load(Marshal.dump(arr)); @arrLen=arr.length; @len=@arrLen; if @coef<0; i=-1; while (i+=1)<@len; @que[i][@tarIdx]*=-1; end; end; @que.sort_by!{|v|v[@tarIdx]}; end

    def pop; return nil if @len<1; if @len==1; @len-=1; return getCorrectedVector(@que[0]); end; res=@que[0]; @que[0]=@que[@len-1]; @len-=1; i=0; curVal=@que[i][@tarIdx]; while true; lid,rid=i*2+1,i*2+2; break if @len<=lid; rid=lid if @len<=rid; lVal=@que[lid][@tarIdx]; rVal=@que[rid][@tarIdx]; if lVal<curVal || rVal<curVal; (lVal<=rVal)?(swp=lid):(swp=rid); @que[i],@que[swp]=@que[swp],@que[i]; i=swp; else; break; end; end; return getCorrectedVector(res); end
    def push(v); if @len==@arrLen; @que << getCorrectedVector(v); @len+=1; @arrLen+=1; else; @que[@len]=getCorrectedVector(v); @len+=1; end; i=@len-1; while (pid=getParentID(i)); if @que[i][@tarIdx]<@que[pid][@tarIdx]; @que[i],@que[pid]=@que[pid],@que[i]; i=pid; else; break; end; end; end
    def getScalar; (0<@len)?(return @que[0][@tarIdx]*@coef):(return nil); end
    def getVector; (0<@len)?(return copyCorrectedVector(@que[0])):(return nil); end
    def get2ndScalar; if @len<2; return nil; elsif @len<3; return @que[1][@tarIdx]*@coef; end; l,r=@que[1][@tarIdx],@que[2][@tarIdx]; (l<=r)?(return l*@coef):(return r*@coef); end
    def get2ndVector; if @len<2; return nil; elsif @len<3; return copyCorrectedVector(@que[1]); end; l,r=@que[1][@tarIdx],@que[2][@tarIdx]; (l<=r)?(tarID=1):(tarID=2); return copyCorrectedVector(@que[tarID]); end
    def getQue; return @que; end
    def getLen; return @len; end

    def getCorrectedVector(vct); vct[@tarIdx]*=@coef; return vct; end
    def copyCorrectedVector(vct); cpyVct=Marshal.load(Marshal.dump(vct)); return getCorrectedVector(cpyVct); end
    def getParentID(cid); (0 < cid)?(return (cid-1)/2):(return nil); end
end
