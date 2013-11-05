require './triangle'
describe Triangle do
    it "should have a perimeter" do
        triangle = Triangle.new 100
        triangle.perimeter.should == 100
    end
    it "should have three sides that equal the perimeter" do
        triangle = Triangle.new 100
        (triangle.a + triangle.b + triangle.c).should == triangle.perimeter
    end
    it "should have sides a = 3, b = 4, c = 5 if perimeter is 12" do
        triangle = Triangle.new 12
        triangle.perimeter.should eq(12)
        triangle.a.should eq(3)
        triangle.b.should eq(4)
        triangle.c.should eq(5)
    end
end