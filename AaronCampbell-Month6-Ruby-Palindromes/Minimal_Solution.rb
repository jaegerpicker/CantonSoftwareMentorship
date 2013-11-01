answer = 0
100.upto(999) do |x|
  x.upto(999) do |y|
      answer = x * y if (x * y).to_s == (x * y).to_s.reverse and x * y > answer
  end
end
puts answer