class Triangle
    attr_reader :a, :b, :c
    #attr_writer :perimeter
    def initialize perimeter
        @perimeter = perimeter
        find_sides
    end
    def perimeter
       @a + @b + @c 
    end
    def find_sides
        m = 1
        n = 2
        a = b = c = solution = 0
        until solution == @perimeter do
            while n < @perimeter / 3 do
                # a = n^2 - m ^ 2
                # b = 2nm
                # c = n^2 + m^2
                a = (n ** 2) - (m ** 2)
                b = 2 * n * m
                c = (n ** 2) + (m ** 2)
                solution = a + b + c if (a ** 2) + (b ** 2) == (c ** 2)
                if solution == @perimeter
                    break
                end
                n += 1
            end
            m += 1
            n = m + 1
        end
        @a = a
        @b = b
        @c = c
    end
end

t = Triangle.new 1000
puts t.a.to_s + '^2 + ' + t.b.to_s + '^2 = ' + t.c.to_s + '^2'
puts t.a * t.b * t.c