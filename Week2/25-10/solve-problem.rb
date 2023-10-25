#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby


# Hiring Programmers - Boolean Expressions in Ruby
is_an_experienced_programmer = (candidate.years_of_experience >= 2) 
&& (candidate.language_work_with.include ? 'Ruby') 
&& (candidate.git_hub_points => 500) && (candidate.age >= 15) 
&& (candidate.applied_recently == false)




# Palindromes
def palindrome?(sentence)
  ignore_sentence = sentence.downcase.gsub(' ','')
  ignore_sentence == ignore_sentence.reverse
end




# Compute sum of cubes for given range
def sum_of_cubes(a, b)
  (a..b).inject(0) { |sum, n| sum + n**3}
end




# Find non-duplicate values in an Array
def non_duplicated_values(values)
  values.find_all {|v| values.count(v) == 1}
end



# Check if all elements in an array are Fixnum
def array_of_fixnums?(array)
  array.all? {|i| i.class == Fixnum}
end




# Kaprekar's Number
# solution 1
def kaprekar?(k)
  square = k**2
  num_iterator = square.to_s.length / 2
  num_iterator = num_iterator + 1 if square.to_s.length.odd?
  left = square
  num_iterator.times do
    left /= 10
  end
  right = square - (left * 10**num_iterator)
  k == right + left
end

# solution 2
def kaprekar?(k)
  square = (k**2).to_s
  len = square.length
  left = square[0...len/2].to_i
  right = square[len/2..-1].to_i
  k == left + right 
end




# Enough Contrast?
class Color
  attr_reader :r, :g, :b
  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def brightness_index
    ( 299*@r + 587*@g + 114*@b ) / 1000 
  end

  def brightness_difference(another_color)
    (self.brightness_index - another_color.brightness_index).abs
  end

  def hue_difference(another_color)
    (@r - another_color.r).abs  + (@g - another_color.g).abs + (@b - another_color.b)
  end

  def enough_contrast?(another_color)
    self.brightness_difference(another_color) > 125 && self.hue_difference(another_color) > 500 
  end
end




# Time to run code
def exec_time(proc)
  start_time = Time.now
  proc.call
  end_time = Time.now

  execution_time = end_time - start_time
end

# Use lambda
my_lambda = lambda do
  # Code to be measured
  sum = 0
  1_000_000.times do
    sum += 1
  end
end

# Measure the execution time
time_taken = exec_time(my_lambda)

puts "Execution time: #{time_taken} seconds"




# Number shuffle
def number_shuffle(number)
  arr = number.to_s.split('')
  arr.each_cons {}
end
