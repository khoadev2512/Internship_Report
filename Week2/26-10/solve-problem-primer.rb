# Number shuffle
def number_shuffle(number)
  arr = number.to_s.split('')
  num_of_element = (arr.count == 3 ? 6 : 24)
  result = []
  while result.count < num_of_element
    new_element = arr.shuffle
    if !result.include? new_element
      result << new_element.join.to_i
    end
  end
  result
end





# Your sum
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0)
    return @array.reduce(:+) + initial_value unless block_given?
    sum = initial_value
    @array.each {|e| sum += yield(e)}
    sum
  end
end




 # Orders and costs
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    cost = 0
    orders.each do |order|
      cost +=  order.key.inject(0) {|sum,i| sum + @menu[i] * order[i]}
    end
    cost
  end
end

