require 'test/unit/assertions'
include Test::Unit::Assertions

def generateMath(n, m)
  result = []
  operators = ['+', '-', '/']
  
  while result.size < n
    expression = []
    
    m.times do
      num = rand(1..100)
      op = operators.sample
      expression << "#{num} #{op}"
    end
    equation = expression.join(' ')
    total = eval(equation[0..-3])
    if total <= 100
      result << equation[0..-3]
    end
  end
  result
end

# Check testcase function
def count_numbers_and_operators(str)
  pattern = /(\d+|\+|-|\*|\/)/
  matches = str.scan(pattern)
  num_count = 0
  op_count = 0
  matches.each do |match|
    if match.is_a?(Array) && match[0] =~ /\d/
      num_count += 1
    else
      op_count += 1
    end
  end
  [num_count, op_count]
end

Test.assert_equal(generateMath(2, 3).size, 2)
Test.assert_equal(generateMath(3, 3).size, 3)
Test.assert_equal(generateMath(2, 2).all? { |i| eval(i) <= 100 }, true)
Test.assert_equal(generateMath(4, 3).all? { |i| eval(i) <= 100 }, true)
Test.assert_equal(generateMath(4, 3).all? { |i| count_numbers_and_operators(i) == [3,2]}, true )


