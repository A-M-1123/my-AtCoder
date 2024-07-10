def gInt()
  gets.to_i
end
def gInts()
  gets.split.map(&:to_i)
end
def gIntMat(n)
  n.times.map{gInts()}
end
def gIntVars(n)
  gIntMat(n).transpose
end
# g...Int Ints IntMat(n) IntVars(n)

def gStrs()
  gets.chomp.split
end
def gCharsDiv()
  gets.chomp.split("")
end
def gCharMat(n)
  n.times.map{gCharsDiv()}
end
def gStrsVart(n)
  n.times.map{gets.chomp}
end
# g...Strs CharsDiv CharMat(n) StrsVart(n)