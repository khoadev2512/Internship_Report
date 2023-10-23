#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby

def length_finder(array)
	result = []
	array.each do |i|
		result << i.length
	end
	return result 
end

#Usage
p length_finder(['Ruby','Rails','C42'])
p length_finder(['Some','Other','Array','Of','String'])
