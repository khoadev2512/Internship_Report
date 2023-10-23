#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby

def your_method(array)
	return false unless array.length == 2
	array.each do |i|
		if !i.is_a?(String) || i.empty?
			return false
		end
	end
	check = array[1].split("")
	check.each do |i|
		if !array[0].match(i) 
			return false
		end
	end
	return true
end

p your_method(["ab", "aabba"])
p your_method(["ab", "aabbac"])	
p your_method(["ab", "aabba","anc"])
p your_method(["ab", 1])

