# Directions Reduction (5kyu)
def dirReduc(arr)
  pairs = {"NORTH" => "SOUTH","SOUTH" => "NORTH","WEST" => "EAST", "EAST" => "WEST"}
  idx = 0
  while(idx < arr.count - 1)
    if pairs[arr[idx]] == arr[idx+1]
      arr.delete_at(idx+1)
      arr.delete_at(idx)
      idx = 0
    else
      idx += 1 
    end
  end
  arr
end




# Count characters in your string  (6kyu)
def count_chars(s)
  result = {}
  s.chars { |char| result.keys.include?(char) ? result[char] += 1 : result[char] = 1 }
  result
end




#Calculating with Functions   (6kyu)
Ruby:
def zero(op = nil)
  op.nil? ? 0 : op.call(0)
end
def one(op = nil)
  op.nil? ? 1 : op.call(1)
end
def two(op = nil)
  op.nil? ? 2 : op.call(2)
end
def three(op = nil)
  op.nil? ? 3 : op.call(3)
end
def four(op = nil)
  op.nil? ? 4 : op.call(4)
end
def five(op = nil)
  op.nil? ? 5 : op.call(5)
end
def six(op = nil)
  op.nil? ? 6 : op.call(6)
end
def seven(op = nil)
  op.nil? ? 7 : op.call(7)
end
def eight(op = nil)
  op.nil? ? 8 : op.call(8)
end
def nine(op = nil)
  op.nil? ? 9 : op.call(9)
end
def plus(num)
  -> (x) { x + num }
end
def minus(num)
  -> (x) { x - num }
end
def times(num)
  -> (x) { x * num }
end
def divided_by(num)
  -> (x) { x / num }
end




#The Hashtag Generator    
def generateHashtag(str)
  return false if str.empty? || str.length > 140
  "##{str.gsub!(" ","")}"
end




#Maximum subarray sum
def max_sequence(arr)
  return 0 if arr.all? { |i| i.negative? }
  return arr.sum if arr.all? { |i| i.positive?}
  max = arr[0]
  for x in 1..arr.length
    arr.each_cons(x) {|sub| max = sub.sum if sub.sum > max}
  end
  max
end




#Pete, the baker  (5kyu)
def cakes(recipe, available)
  return 0 if (recipe.keys & available.keys) != recipe.keys
  cake = 9999
  recipe.each do |ingre, qty| 
    cake = available[ingre] / qty if cake > available[ingre] / qty
  end
  cake
end



# Snail  (4kyu)
def snail(array)
  result = []

  while array.any?
    result += array.shift
    p "1: #{array}"
    array.each { |row| result << row.pop }
    p "2: #{array}"
    result += (array.pop || []).reverse
    p "3: #{array}"
    array.reverse.each { |row| result << row.shift }
    p "4: #{array}"
  end
  result
end



# Range Extraction  (4kyu)
def solution(list)
  result = list[0].to_s
  result << "," if list[0] + 1 != list[1]

  for idx in 1...list.count

    if list[idx] - 1 != list[idx-1]
      result << list[idx].to_s
      result << "," if list[idx] + 1 != list[idx+1] 
    elsif list[idx] + 1 != list[idx+1]
         list[idx-1] == list[idx-2] + 1 ? result << "-" : result << ","
         result << list[idx].to_s + ","
    end

  end
  result[0..-2]
end




# Next bigger number with the same to_digits  (4kyu)
def next_bigger(n)
  arr = n.to_s.chars.map(&:to_i)
  length = arr.length

  i = length - 2
  while i >= 0 && arr[i] >= arr[i + 1]
    i -= 1
  end

  return -1 if i == -1

  j = length - 1
  j -= 1 while arr[j] <= arr[i]

  arr[i], arr[j] = arr[j], arr[i]
  arr[i + 1..-1] = arr[i + 1..-1].reverse
  result = arr.join.to_i
  return result > n ? result : -1
end




# The observed PIN        (4kyu)    
def get_pins(observed)
  map = {"0"=>["0","8"],"1"=>["1","2","4"], "2"=>["2","1","3","5"], "3"=>["3","2","6"], "4"=>["4","1","5","7"], "5"=>["5","2","4","6","8"], "6"=>["6","3","5","9"], "7"=>["7","4","8"], "8"=>["8","5","7","9","0"],"9"=>["9","6","8"]}
  list =[]
  observed.chars.each { |i| list << map[i]}
  all_combinations = ->(arrays) do
  if arrays.empty?
    [[]]
  else
    head, *rest = arrays
    rest_combinations = all_combinations.call(rest)
    head.flat_map do |element|
      rest_combinations.map { |subarray| [element] + subarray }
    end
  end
  end
  combinations = all_combinations.call(list)
  combinations.map { |i| i.join}
end