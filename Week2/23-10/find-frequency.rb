#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby

def find_frequency(sentence, word)
  	words = sentence.split(" ")
  	return words.count(word)
end 

p find_frequency("The method, given 'Ruby is The best language in the World'", "The")

