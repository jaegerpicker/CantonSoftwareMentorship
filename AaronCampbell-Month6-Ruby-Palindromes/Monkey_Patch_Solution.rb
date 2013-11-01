class Fixnum
    def is_palindrome?
        to_s == to_s.reverse
    end
    def largest_palindrome_product max = 9999
        answer = 0
        self.upto(max) do |x|
          x.upto(max) do |y|
              product = x * y
              if product.is_palindrome?
                  if x * y > answer
                      answer = x * y
                  end
              end
          end
       end
       answer
    end
end
#puts 10.largest_palindrome_product 99    # = 9009
puts 100.largest_palindrome_product 999   # = 906609