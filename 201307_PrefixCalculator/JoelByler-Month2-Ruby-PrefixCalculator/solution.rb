require 'rspec'

#Monkey Patch
class Array
  def second
    self[1]
  end
  def middle
    self[1..self.size - 2]
  end
end

class PrefixEvaluationEvaluator
  def initialize (expression)
    @expression = expression
  end
  def evaluate
    parse_list @expression.split
  end
  def parse_list expr_list
    if expr_list.length > 3
      inner_result = parse_list expr_list.middle
      expr_list = [expr_list.first, inner_result, expr_list.last]
    end
    do_math expr_list.first, expr_list.second.to_i, expr_list.last.to_i
  end
  def do_math operator, arg1, arg2
    if operator == '+'
      return arg1 + arg2
    elsif operator == '*'
      return arg1 * arg2
    elsif operator == '/'
      return arg1 / arg2
    end
  end
end

ARGV.each do |arg|
  File.open(arg, "r").each_line do |line|
    evaluator = PrefixEvaluationEvaluator.new line
    puts evaluator.evaluate
  end
end

describe PrefixEvaluationEvaluator do

  it 'add 1 and 2 to make 3' do
    evaluator = PrefixEvaluationEvaluator.new '+ 1 2'
    evaluator.evaluate.should == 3
  end
  it 'add 2 and 2 to make 4' do
    evaluator = PrefixEvaluationEvaluator.new '+ 2 2'
    evaluator.evaluate.should == 4
  end
  it 'add 1, 2 and 3 to make 6' do
    evaluator = PrefixEvaluationEvaluator.new '+ + 1 2 3'
    evaluator.evaluate.should == 6
  end
  it 'add four numbers' do
    evaluator = PrefixEvaluationEvaluator.new '+ + + 1 2 3 4'
    evaluator.evaluate.should == 10
  end
  it 'multiply 2 and 3' do
    evaluator = PrefixEvaluationEvaluator.new '* 2 3'
    evaluator.evaluate.should == 6
  end
  it 'divide 6 by 2' do
    evaluator = PrefixEvaluationEvaluator.new '/ 6 2'
    evaluator.evaluate.should == 3
  end
  it 'solves the example' do
    evaluator = PrefixEvaluationEvaluator.new '* + 2 3 4'
    evaluator.evaluate.should == 20
  end
end
