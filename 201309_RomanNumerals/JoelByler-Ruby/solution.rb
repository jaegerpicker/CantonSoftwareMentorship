require 'rspec'

ROMAN_NUMBERS = {

  :onethousand => {:number => 1000, :symbol => 'M'},
  :ninehundred => {:number => 900, :symbol => 'CM'},
  :fivehundred => {:number => 500, :symbol => 'D'},
  :fourhundred => {:number => 400, :symbol => 'CD'},
  :onehundred => {:number => 100, :symbol => 'C'},
  :ninety => {:number => 90, :symbol => 'XC'},
  :fifty => {:number => 50, :symbol => 'L'},
  :fourty => {:number => 40, :symbol => 'XL'},
  :ten => {:number => 10, :symbol => 'X'},
  :nine => {:number => 9, :symbol => 'IX'},
  :five => {:number => 5, :symbol => 'V'},
  :four => {:number => 4, :symbol => 'IV'},
  :one => {:number => 1, :symbol => 'I'},
}

class RomanNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end
  def to_s
    remainder = @number
    numeral = ''
    ROMAN_NUMBERS.values.each do |value|
      while (remainder - value[:number] >=0)
        numeral = numeral + value[:symbol]
        remainder = remainder - value[:number]
      end
    end
    return numeral
  end
end

ARGV.each do |arg|
  File.open(arg, "r").each_line do |line|
    solver = RomanNumber.new line.to_i
    puts solver.to_s
  end
end

describe RomanNumber do
  it 'converts 1 to I' do
    RomanNumber.new(1).to_s.should == 'I'
  end
  it 'converts 2 to II' do
    RomanNumber.new(2).to_s.should == 'II'
  end
  it 'converts 3 to III' do
    RomanNumber.new(3).to_s.should == 'III'
  end
  it 'converts 4 to IV' do
    RomanNumber.new(4).to_s.should == 'IV'
  end
  it 'converts 5 to V' do
    RomanNumber.new(5).to_s.should == 'V'
  end
  it 'converts 6 to VI' do
    RomanNumber.new(6).to_s.should == 'VI'
  end
  it 'converts 7 to VII' do
    RomanNumber.new(7).to_s.should == 'VII'
  end
  it 'converts 8 to VIII' do
    RomanNumber.new(8).to_s.should == 'VIII'
  end
  it 'converts 9 to IX' do
    RomanNumber.new(9).to_s.should == 'IX'
  end
  it 'converts 10 to X' do
    RomanNumber.new(10).to_s.should == 'X'
  end
  it 'converts 40 to XL' do
    RomanNumber.new(40).to_s.should == 'XL'
  end
  it 'converts 50 to L' do
    RomanNumber.new(50).to_s.should == 'L'
  end
  it 'converts 90 to L' do
    RomanNumber.new(90).to_s.should == 'XC'
  end
  it 'converts 100 to C' do
    RomanNumber.new(100).to_s.should == 'C'
  end
  it 'converts 400 to CD' do
    RomanNumber.new(400).to_s.should == 'CD'
  end
  it 'converts 500 to D' do
    RomanNumber.new(500).to_s.should == 'D'
  end
  it 'converts 900 to CM' do
    RomanNumber.new(900).to_s.should == 'CM'
  end
  it 'converts 1000 to M' do
    RomanNumber.new(1000).to_s.should == 'M'
  end

  it 'Example #1' do
    RomanNumber.new(159).to_s.should == 'CLIX'
  end
  it 'Example #2' do
    RomanNumber.new(296).to_s.should == 'CCXCVI'
  end
  it 'Example #3' do
    RomanNumber.new(3992).to_s.should == 'MMMCMXCII'
  end
  
end
