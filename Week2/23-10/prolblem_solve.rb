#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby


# Calculator perfrom add and substract
class Calculator
  def add(a, b)
    return a + b
  end

  def subtract(a, b)
    return a - b
  end
end

newCal = Calculator.new
puts newCal.add 1224,2123
puts newCal.subtract 4234,8493





# Find the frequency of a string in a sentence
def find_frequency(sentence, word)
    words = sentence.split(" ")
    return words.count(word)
end 

p find_frequency("The method, given 'Ruby is The best language in the World'", "The")	#result: 2





# Find the length of a strings in an array
def length_finder(array)
  result = []
  array.each do |i|
    result << i.length
  end
  return result 
end

p length_finder(['Ruby','Rails','C42'])				#result: [4,5,3]
p length_finder(['Some','Other','Array','Of','String']) 	#result: [4,4,5,2,6]


# Select random elements from an array
def random_select(array, n)
  result = []
  n.times do
   result << array[rand(array.length)] 
  end
  result
end

p random_select([1, 2, 3, 4, 5],2)





# Sort the words in a given sentence
def sort_string(string)
  string.split(' ').sort{|x, y| x.length <=> y.length}.join(' ')
end

p sort_string("Sort words in a sentence") 	# result: "a in Sort words sentence"
