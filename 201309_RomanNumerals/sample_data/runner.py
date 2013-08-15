from subprocess import call, Popen, PIPE
import sys, time
###############C# ##########################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
user = "ShawnCampbell"
month = "Month4"
langauge = "C#"
challenge = "RomanNumerals"
runtime_path = "mono"
exe_path = "RomanNumeralsExamples/RomanNumeralsExamples/bin/Release/RomanNumeralsExamples.exe"
sample_data = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/sample_data/input-1MilLines.txt"
program = dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path
#print program
p1 = Popen(runtime_path + " " + program + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "C# took: " + str(diff) + " milliseconds"
###############C ###########################
start = int(round(time.time() * 1000))
langauge = "C"
runtime_path = ""
exe_path = "RomanNumerals"
dir_path = "/Users/shawn/Library/Developer/Xcode/DerivedData/RomanNumerals-czarcxkkhpuohjeirlhkeavoczdr/Build/Products/Debug/"
#print dir_path + exe_path
p1 = Popen(dir_path + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output =  p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "C took: " + str(diff) + " milliseconds"
###############C++ #########################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Library/Developer/Xcode/DerivedData/RomanNumerals-fxzoxnalhpbyclexcpqiztgpjjfn/Build/Products/Release/"
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
###############Go ##########################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
langauge = "Go"
runtime_path = "go"
runtime_option = "run"
exe_path = "solution.go"
#print runtime_path + " " + runtime_option + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path
p1 = Popen(runtime_path + " " + runtime_option + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "Go took: " + str(diff) + " milliseconds"
################Java #######################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
langauge = "Java"
runtime_path = "java"
exe_path = "Solution"
#print [runtime_path, "-classpath " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src", exe_path, sample_data]
p1 = Popen(runtime_path + " -classpath " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src/ " +  exe_path + " " + sample_data, shell=True, stdout=PIPE)
output =  p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "Java took: " + str(diff) + " milliseconds"
################NodeJS ######################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
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
##################ObjC #######################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Library/Developer/Xcode/DerivedData/RomanNumerals-bvqqdcvcnepmwdhhwhtrwetgnjrc/Build/Products/Debug/"
langauge = "ObjC"
runtime_path = ""
exe_path = "RomanNumerals"
p1 = Popen(dir_path + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "ObjC took: " + str(diff) + " milliseconds"
###################Python ####################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
langauge = "Python"
runtime_path = "python"
exe_path = "solution.py"
p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "Python took: " + str(diff) + " milliseconds"
####################Ruby ######################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
langauge = "Ruby"
runtime_path = "ruby"
exe_path = "solution.rb"
p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "Ruby took: " + str(diff) + " milliseconds"
#####################Scala ####################
start = int(round(time.time() * 1000))
dir_path = "/Users/shawn/Documents/CantonSoftwareMentorship/201309_RomanNumerals/"
langauge = "Scala"
runtime_path = "scala"
exe_path = "Solution.scala"
p1 = Popen(runtime_path + " " + dir_path + user + "-" + month + "-" + langauge + "-" + challenge + "/src/" + exe_path + " " + sample_data, shell=True, stdout=PIPE)
output = p1.stdout.read()
end = int(round(time.time() * 1000))
diff = end - start
print "Scala took: " + str(diff) + " milliseconds"