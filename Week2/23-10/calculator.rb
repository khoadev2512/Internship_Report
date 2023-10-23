#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby

#Create a class Calculator, which performs addition and subtraction of two numbers at a time

class Calculator
  def add(a, b)
    return a + b
  end

  def subtract(a, b)
    return a - b
  end
end


#Usage

newCal = Calculator.new
puts newCal.add 1224,2123
puts newCal.subtract 4234,8493
