require 'fileutils'
require 'time'

t1 = Time.now
$values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
$numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
def convert_to_roman num
  results = ""
  number = num.to_i()
  for i in (0..12)
    while number > $values[i]
      number -= $values[i]
      results += $numerals[i]
    end
  end
  puts results
end
File.open(ARGV[0], "r") do |f|
  f.each_line{|line| convert_to_roman(line)}
end
t2 = Time.now
delta = t2 - t1
puts "It took me: " + (delta * 1000).to_s + " milliseconds"