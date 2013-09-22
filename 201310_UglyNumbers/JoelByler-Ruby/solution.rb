require 'rspec'

# Monkey Patch >;)
class Integer
  def ugly?
    [2,3,5,7].each do |n|
      return true if (self.to_f / n.to_f) == (self.to_f / n.to_f).round
    end
    false
  end
end

class UglyStringHunter
  attr_reader :string
  def initialize(string='')
    @string = string.to_s
  end
  def variations
    return [@string] if @string.length == 1

    prefix = @string[0]

    result = next_variations(@string)

    result.each { |s| s.prepend(prefix) }
  end
  def next_variations(partial_string)
    return [] if partial_string.length == 0
    partial_string[0] = ''
    this_set = prefix_set partial_string
    if partial_string.length == 1 then
      return this_set
    end
    next_set = next_variations(partial_string)
    add_prefix_to_set this_set, next_set
  end
  def prefix_set partial_string
    first_char = partial_string[0]
    [first_char, "-#{first_char}", "+#{first_char}"]
  end
  def add_prefix_to_set prefix_set, postfix_set
    result = []
    prefix_set.each do |prefix|
      postfix_set.each do |postfix|
        result << "#{prefix}#{postfix}"
      end
    end
    result
  end
  def evaluate(formula)
    formula.gsub! '-', '+-'
    result = 0
    formula.split('+').each do |number|
      result = result + number.to_i
    end
    result
  end

  def how_ugly?
    result = []
    variations.each do |formula|
      resulting_number = evaluate(formula)
      result << resulting_number if resulting_number.ugly?
    end
    result.length
  end
end

ARGV.each do |arg|
  if !arg.include? '.rb'
    File.open(arg, "r").each_line do |line|
      solver = UglyStringHunter.new line.strip
      puts solver.how_ugly?
    end
  end
end

describe UglyStringHunter do
  it 'there is only one variation with for string [1]' do
    UglyStringHunter.new('1').variations.length.should == 1
  end
  it 'there are three variations with 11' do
    variations = UglyStringHunter.new('12').variations
    variations.include?('12').should be_true
    variations.include?('1+2').should be_true
    variations.include?('1-2').should be_true
  end
  it 'there are nine variations with 123' do
    variations = UglyStringHunter.new('123').variations
    variations.include?('123').should be_true
    variations.include?('1+23').should be_true
    variations.include?('1-23').should be_true
    variations.include?('12+3').should be_true
    variations.include?('12-3').should be_true
    variations.include?('1+2+3').should be_true
    variations.include?('1+2-3').should be_true
    variations.include?('1-2+3').should be_true
    variations.include?('1-2-3').should be_true
  end
  it "'1+1+1 evaluates to 3" do
    UglyStringHunter.new.evaluate('1+1+1').should == 3
  end
  it "'1+2+3 evaluates to 6" do
    UglyStringHunter.new.evaluate('1+2+3').should == 6
  end
  it "'3+2-1 evaluates to 4" do
    UglyStringHunter.new.evaluate('3+2-1').should == 4
  end
  it '9 has an ugliness of 1' do
    UglyStringHunter.new('9').how_ugly?.should == 1
  end
  it '011 has an ugliness of 6' do
    UglyStringHunter.new('011').how_ugly?.should == 6
  end
  it '12345 has an ugliness of 64' do
    UglyStringHunter.new('12345').how_ugly?.should == 64
  end
end

describe Integer do
  it '0 is ugly' do
    0.ugly?.should be_true
  end
  it '1 is not ugly' do
    1.ugly?.should be_false
  end
  it '2 is ugly' do
    2.ugly?.should be_true
  end
  it '3 is ugly' do
    3.ugly?.should be_true
  end
  it '4 is ugly' do
    4.ugly?.should be_true
  end
  it '14 is ugly' do
    14.ugly?.should be_true
  end    
  it '13 is NOT ugly' do
    13.ugly?.should be_false
  end    
  it '-14 is ugly' do
    -14.ugly?.should be_true
  end    
  it '-13 is NOT ugly' do
    -13.ugly?.should be_false
  end    
  it '39 is ugly' do
    39.ugly?.should be_true
  end    
  it '121 is NOT ugly' do
    121.ugly?.should be_false
  end    
end
