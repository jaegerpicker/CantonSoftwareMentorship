from subprocess import call, Popen, PIPE
import sys, time
from xlsxwriter.workbook import Workbook

def write_time(lang, runtime, version, author, time, row, sheet):
	sheet.write(row, 0, lang)
	sheet.write(row, 1, runtime)
	sheet.write(row, 2, version)
	sheet.write(row, 3, author)
	sheet.write(row, 4, time)

row = 0
col = 0
loop_times = 10
wb = Workbook("RomanNumeralsTimeResults.xlsx", {'constant_memory': True})
sheet = wb.add_worksheet("data")
sheet.write(row, col, "Langauge")
col += 1
sheet.write(row, col, "Runtime")
col += 1
sheet.write(row, col, "Version")
col += 1
sheet.write(row, col, "Author")
col += 1
sheet.write(row, col, "Time")
col = 0
row += 1
os_user = "shawn"
###############C# ##########################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	user = "ShawnCampbell"
	month = "Month4"
	langauge = "C#"
	challenge = "RomanNumerals"
	runtime_path = "mono"
	exe_path = "RomanNumeralsExamples/RomanNumeralsExamples/bin/Release/RomanNumeralsExamples.exe"
	sample_data = dir_path + "sample_data/input-1MilLines.txt"
	program = dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path
	#print program
	p1 = Popen(runtime_path + " " + program + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "C# took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
###############C ###########################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	langauge = "C"
	runtime_path = ""
	exe_path = "RomanNumerals"
	dir_path = "/Users/" + os_user + "/Library/Developer/Xcode/DerivedData/RomanNumerals-czarcxkkhpuohjeirlhkeavoczdr/Build/Products/Debug/"
	#print dir_path + exe_path
	p1 = Popen(dir_path + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output =  p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "C took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
###############C2 ###########################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	langauge = "C"
	runtime_path = ""
	exe_path = "RomanNumerals"
	dir_path = "/Users/" + os_user + "/Library/Developer/Xcode/DerivedData/RomanNumerals-czarcxkkhpuohjeirlhkeavoczdr/Build/Products/Debug/"
	#print dir_path + exe_path + " l " + sample_data
	p1 = Popen(dir_path + exe_path + " " + sample_data + " l", shell=True, stdout=PIPE)
	output =  p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "C2 took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 2, user, diff, row, sheet)
	row += 1
###############C++ #########################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Library/Developer/Xcode/DerivedData/RomanNumerals-fxzoxnalhpbyclexcpqiztgpjjfn/Build/Products/Release/"
	langauge = "C++"
	runtime_path = ""
	exe_path = "RomanNumerals"
	#print dir_path + exe_path + " " + sample_data
	p1 = Popen(dir_path + exe_path + " " + sample_data + " t", shell=True, stdout=PIPE, stderr=PIPE)
	#print p1.stderr.read()
	output = p1.stdout.read()
	#print output
	end = int(round(time.time() * 1000))
	diff = end - start
	print "C++ took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
###############Go ##########################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "Go"
	runtime_path = ""
	runtime_option = ""
	exe_path = "GoLangRomanNumerals"
	#print runtime_path + " " + runtime_option + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path
	p1 = Popen(dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "Go took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
################Java #######################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "Java"
	runtime_path = "java"
	exe_path = "Solution"
	#print [runtime_path, "-classpath " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src", exe_path, sample_data]
	p1 = Popen(runtime_path + " -classpath " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src/ " +  exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output =  p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "Java took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
################NodeJS ######################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "NodeJS"
	runtime_path = "node "
	exe_path = "solution.js"
	#print runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data
	p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	#call([runtime_path, dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path, sample_data])
	end = int(round(time.time() * 1000))
	diff = end - start
	print "NodeJS took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
##################ObjC #######################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Library/Developer/Xcode/DerivedData/RomanNumerals-bvqqdcvcnepmwdhhwhtrwetgnjrc/Build/Products/Debug/"
	langauge = "ObjC"
	runtime_path = ""
	exe_path = "RomanNumerals"
	p1 = Popen(dir_path + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "ObjC took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
###################Python ####################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "Python"
	runtime_path = "python"
	exe_path = "solution.py"
	p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "Python took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
####################Ruby ######################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "Ruby"
	runtime_path = "ruby"
	exe_path = "solution.rb"
	p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "Ruby took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
#####################Scala ####################
for j in range(0, loop_times):
	start = int(round(time.time() * 1000))
	dir_path = "/Users/" + os_user + "/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
	langauge = "Scala"
	runtime_path = "scala"
	exe_path = "Solution.scala"
	p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
	output = p1.stdout.read()
	end = int(round(time.time() * 1000))
	diff = end - start
	print "Scala took: " + str(diff) + " milliseconds"
	write_time(langauge, 1, 1, user, diff, row, sheet)
	row += 1
wb.close()
