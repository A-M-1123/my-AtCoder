class OpMatrix
  def initialize(mat)
    @mat = mat
    @rowN = mat.length
    @colN = mat[0].length
    @rowID = Array.new(@rowN,0)
    @rowN.times{|i| @rowID[i] = i}
    @colID = Array.new(@colN,0)
    @colN.times{|i| @colID[i] = i}
    @inv = false
    @rRev = false
    @cRev = false
  end

  def rSwap(i,j)
    if @inv
      i,j = calcCPos(i),calcCPos(j)
      doCSwap(i,j)
    else
      i,j = calcRPos(i),calcRPos(j)
      doRSwap(i,j)
    end
  end
  def cSwap(i,j)
    if @inv
      i,j = calcRPos(i),calcRPos(j)
      doRSwap(i,j)
    else
      i,j = calcCPos(i),calcCPos(j)
      doCSwap(i,j)
    end
  end

  def inverse()
    @inv = !@inv
  end
  def rReverse()
    @rRev = !@rRev
  end
  def cReverse()
    @cRev = !@cRev
  end
  def reverse()
    rReverse()
    cReverse()
  end

  def getElement(r,c)
    i,j = calcPos(r,c)
    return @mat[i][j]
  end
  def getMatrix()
    (@inv) ? (h,w = @colN,@rowN):(h,w = @rowN,@colN)
    newMat = Array.new(h).map{Array.new(w)}
    for i in 0..(h-1)
      for j in 0..(w-1)
        newMat[i][j] = getElement(i,j)
      end
    end
    return newMat
  end
  def viewMatrix()
    newMat = getMatrix()
    (@inv) ? (h = @colN):(h = @rowN)
    for i in 0..(h-1)
      puts newMat[i].join(" ")
    end
  end
  
  private

  def calcRPos(r)
    (@rRev) ? (id = @rowN-1-r):(id = r)
    return id
  end
  def calcCPos(c)
    (@cRev) ? (id = @colN-1-c):(id = c)
    return id
  end
  def calcPos(r,c)
    r,c = c,r if @inv
    r,c = calcRPos(r),calcCPos(c)
    return [@rowID[r],@colID[c]]
  end

  def doRSwap(i,j)
    i,j = j,i
    @rowID[i],@rowID[j] = @rowID[j],@rowID[i]
  end
  def doCSwap(i,j)
    i,j = j,i
    @colID[i],@colID[j] = @colID[j],@colID[i]
  end
end
