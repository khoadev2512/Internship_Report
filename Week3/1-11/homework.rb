# frozen_string_literal: true

require 'test/unit/assertions'
include Test::Unit::Assertions

def generateMath(n, m)
  result = []
  operators = ['+', '-']
  while result.size < n
    expression = []
    m.times { expression << "#{rand(1..100)} #{operators.sample}" }
    equation = expression.join(' ')
    total = eval?(equation[0..-3])
    result << equation[0..-3] if total <= 100
  end
  result
end

# Check testcase function
def test_func(str)
  num_count = str.scan(/\d+/).count
  op_count = str.scan(%r{[+\-*/]}).count
  [num_count, op_count]
end

Test.assert_equal(generateMath(2, 3).size, 2)
Test.assert_equal(generateMath(3, 3).size, 3)
Test.assert_equal(generateMath(2, 2).all? { |i| eval?(i) <= 100 }, true)
Test.assert_equal(generateMath(4, 3).all? { |i| eval?(i) <= 100 }, true)
Test.assert_equal(generateMath(4, 3).all? { |i| test_func(i) == [3, 2] }, true)
