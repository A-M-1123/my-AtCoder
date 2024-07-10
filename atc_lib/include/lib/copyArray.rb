def copyArray(a)
  return Marshal.load(Marshal.dump(a))
end
# copyArray(array)