import sys, time
start = int(round(time.time() * 1000))
test_cases = open(sys.argv[1], 'r')
values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
count = 0
for test in test_cases:
	if test != '':
		number = int(test)
		results = ""
		for i in range(0, 12):
			while number > values[i]:
				number -= values[i]
				results += numerals[i]
		print str(count) + ": " + results
		count += 1
end = int(round(time.time() * 1000))
diff = end - start
print "It took me: " + str(diff) + " milliseconds"