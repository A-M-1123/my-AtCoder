def calcRange(st,en)
    return [] if st > en
    st = 0 if st < 0
    
    ret = []
    en += 1
    isClimb = ((0 < st)?(true):(false))
    while st < en
        if isClimb
            w = ((1 << st.bit_length) - st) & st
            if w <= en-st
                ret << [st,st+w-1]
                st += w
            else
                isClimb = false
            end
        else
            w = 1 << ((en-st).bit_length - 1)
            ret << [st,st+w-1]
            st += w
        end
    end
    return ret
end
