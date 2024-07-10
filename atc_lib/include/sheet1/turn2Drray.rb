def turn2DArray(a,d,ang)
    d = d.downcase
    return a.reverse if d == "x"
    return a.map(&:reverse) if d == "y"
    ang %= 360
    return nil if ang % 90 != 0
    return a if ang == 0
    return turn2DArray(a,"l",90) if d == "r" && ang == 270
    return turn2DArray(a,"r",90) if d == "l" && ang == 270
    if ang == 180
        return a.reverse.map(&:reverse)
    elsif d == "r"
        return a.transpose.map(&:reverse)
    elsif d == "l"
        return a.transpose.reverse
    end
    return nil
end

def turn2DArray(a,d,ang);d=d.downcase;return a.reverse if d=="x";return a.map(&:reverse) if d=="y";ang%=360;return nil if ang%90!=0;return a if ang==0;return turn2DArray(a,"l",90) if d=="r"&&ang==270;return turn2DArray(a,"r",90) if d=="l"&&ang==270;if ang==180;return a.reverse.map(&:reverse);elsif d=="r";return a.transpose.map(&:reverse);elsif d=="l";return a.transpose.reverse;end;return nil;end
# turn2DArray(array,dir,angle) ... dir=["x","y","l","r"], angle = 90n