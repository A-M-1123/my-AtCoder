def trimPos2DArray(a,c)
    h = a.length
    w = a[0].length
    hRng = [0,h-1]
    wRng = [0,w-1]
    hExs = Array.new(h,F)
    wExs = Array.new(w,F)
    for i in 0..(h-1)
        for j in 0..(w-1)
            if a[i][j] == c
                hExs[i] = T
                wExs[j] = T
            end
        end
    end
    for i in 0..(h-1)
        if hExs[i]
            hRng[0] = i
            break
        end
    end
    for i in 0..(h-1)
        if hExs[h-1-i]
            hRng[1] = h-1-i
            break
        end
    end
    for i in 0..(w-1)
        if wExs[i]
            wRng[0] = i
            break
        end
    end
    for i in 0..(w-1)
        if wExs[w-1-i]
            wRng[1] = w-1-i
            break
        end
    end
    return [hRng,wRng]
end

def trim2DArray(a,pos)
    hRng,wRng = pos
    raH = hRng[1]-hRng[0]+1
    raW = wRng[1]-wRng[0]+1
    retA = Array.new(raH).map{Array.new(raW)}
    for i in 0..(raH-1)
        for j in 0..(raW-1)
            retA[i][j] = a[hRng[0]+i][wRng[0]+j]
        end
    end
    return retA
end

# trimPos2DArray(arr,remainMark) trim2DArray(arr,pos):pos...2*2-Array
