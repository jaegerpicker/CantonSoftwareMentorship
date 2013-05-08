import sys

def strPosition(s, o):
    for i in range(len(o)):
        #print str(i) + ' ' + s + ' ' + o
        if s == o[i]:
            #print 'yep'
            return i
    return 0
#open the file to read samples form. This is done naively without validation, Bad ideain production code
inputData = open(sys.argv[1], 'r')
lineNum = 0
rows = 0
#read all of the samples in
samples = inputData.readlines()
#loop of each in in the file in this example shoul only be one but it's flexible for more
for line in samples:
    #print line
    #split the sample line into an array
    data = line.split(',')
    searchStr = data[1].replace('\n','')
    searchee = data[0]
    charsSearchee = searchee.split()
    match = True
    for i in range(len(searchee)-1):
        #print searchStr + ' ' + searchee[i:len(searchStr)+i]
        #do easy check
        searchSection = searchee[i:len(searchStr) + i]
        if searchStr == searchSection:
            #print 'true loop'
            match = True
            break
        else:
            match = False
        #do the hard wildcard check
        pos = strPosition('*', searchStr)
        previousChar = nextMatching = searchStr[pos-1:pos]
        if previousChar == '\\':
            pos = 0
        #print pos
        if pos > 0:
            if pos == len(searchStr) -1:
                match = True
                break
            nextMatching = searchStr[pos+1:pos+2]
            nextMatchingPos = strPosition(nextMatching, searchSection)
            PreviousMatchPos = strPosition(previousChar, searchSection)
            #print nextMatching  + ' ' + searchSection[pos:]

            swap = searchSection[pos:nextMatchingPos]
            preswap = searchSection[PreviousMatchPos:nextMatchingPos]
            strSwapped = searchStr.replace('*', swap)
            strPrevSwapped = searchStr.replace('*', preswap)
            #print searchSection + ' ' + preswap + ' ' + strPrevSwapped
            if searchSection == strSwapped[i:len(searchStr) + i] or searchSection == strPrevSwapped[i:len(searchStr) + i]:
                match = True
                break
            else:
                match = False


    if match:
        print 'true'
    else:
        print 'false'
        
