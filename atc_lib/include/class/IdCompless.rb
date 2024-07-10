class IdCompless
    def initialize(vs)
        @vs = vs.sort.uniq
        @vLen = vs.length
        @hs = Hash.new(0)
        i = -1
        while (i += 1) < @vLen
            @hs[@vs[i]] = i
        end
    end
    def val(id); return @vs[id]; end
    def id(v); return @hs[v]; end
    def getIds(vArr)
        ids = Array.new(vArr.length)
        i = -1
        while (i += 1) < vArr.length
            ids[i] = @hs[vArr[i]]
        end
        return ids
    end
    def getVals(); return @vs; end
    def getLength(); return @vLen; end
end

class IdCompless
    def initialize(vs); @vs=vs.sort.uniq; @vLen=vs.length; @hs=Hash.new(0); i=-1; while (i+=1)<@vLen; @hs[@vs[i]]=i; end; end
    def val(id); return @vs[id]; end
    def id(v); return @hs[v]; end
    def getIds(vArr); ids=Array.new(vArr.length); i=-1; while (i+=1)<vArr.length; ids[i]=@hs[vArr[i]]; end; return ids; end
    def getVals(); return @vs; end
    def getLength(); return @vLen; end
end
