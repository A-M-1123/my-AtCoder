import os
import shutil

def getFileOpen(txt):
    idxs = []
    for line in txt:
        line = line.rstrip('\n')
        idxs.append(list(map(int, line.split())))
    return idxs

def numberString(num,length):
    numStr = str(num)
    while len(numStr) < length:
        numStr = '0'+numStr
    return numStr

curPath = os.getcwd()

txtFilePath = curPath+'\data.txt'
txtFile = open(txtFilePath,'r')
idxs = getFileOpen(txtFile)

alp = ['A','B','C','D','E','F','G']

for idx,size in idxs:
    idxString = numberString(idx,3)
    newDirPath = curPath+'\ABC'+idxString
    # shutil.rmtree(newDirPath)
    os.mkdir(newDirPath)
    for i in range(size):
        newFilePath = newDirPath+'\ABC'+idxString+'_'+alp[i]+'.rb'
        with open(newFilePath,'w'):
            pass
        
