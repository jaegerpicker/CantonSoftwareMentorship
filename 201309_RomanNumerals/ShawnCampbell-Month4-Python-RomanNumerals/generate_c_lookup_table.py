count = 0
for i in range(0, 3999):
	values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
	numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
	
	
	number = i
	results = ""
	for i in range(0, 12):
		while number > values[i]:
			number -= values[i]
			results += numerals[i]
	print "{ " +  str(count) + ", \"" + results + "\" },"
	count += 1