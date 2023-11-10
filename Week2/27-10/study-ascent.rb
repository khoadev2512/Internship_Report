#7.2 Building Collections
class FibonacciNumbers
  NUMBERS = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

  def each
    NUMBERS.each {|number| yield number }
  end
end

f = FibonacciNumbers.new
if f.respond_to?(:map)
  squares = f.map {|number| number * number }
  puts "The squares of the fibonacci numbers are #{squares}"
else
  puts "I'll reveal the squares to you once you pass the tests."
end



#8.1 The Debugging Primaries
class VisualAcuity
  def initialize(subject, normal)
    @subject = subject.to_f
    @normal = normal.to_f # Convert to float for division
  end
  def can_drive?
    (@subject / @normal) >= 0.5
  end
end

class DrivingLicenseAuthority
  def initialize(name, age, visual_acuity)
    @name = name
    @age = age        # Missing field
    @visual_acuity = visual_acuity
  end

  def valid_for_license?
    @age >= 18 && visual_acuity.can_drive?
  end

  def verdict
    if valid_for_license?
      "#{@name} can be granted driving license"
    else
      "#{@name} cannot be granted driving license"
    end
  end
end




#8.2 Logging
class Order
  def initialize(order_items, customer)
    @logger = Logger.new($stdout)
    @order_items = order_items
    @customer = customer
    @state = :new
    @logger.info "New order from #{@customer}"
  end

  def procure(vendor)
    if @state == :new
      @vendor = vendor
      @state = :procured
      @logger.info "Order procured from #{@vendor}"
    else
      @logger.error "You can procure only new orders"
    end
  end

  def pack
    if @state == :procured
      @state = :packed
      @logger.info "Order packed"
    else
      @logger.error "You can't pack before procuring"
    end
  end

  def ship(address)
    if @state == :packed
      @state = :shipped
      @shipping_address = address
      @logger.info "Order shipped to #{@shipping_address}"
    else
      @logger.error "You can't ship before packing"
    end
  end
end

order = Order.new(["mouse", "keyboard"], "Asta")
order.procure("Awesome Supplier")
order.pack
order.ship("The Restaurant, End of the Universe")




#8.3 Benchmark
require 'benchmark'

num=4000
Benchmark.bm do |benchmark|
  benchmark.report do
    a=[]; num.times { a = a + [num] }
  end
  benchmark.report do
    a=[]; num.times { a << num }
  end
  benchmark.report do
    a=[1..num].map {|number| number}
  end
end



#9.2 What is an object?
class Food
end
class Soup < Food
end
class IceCream < Food
end
class ChineseGreenBeans < Food
end

class DeliveryTray
  FOOD_DISH_MAPPING = {
    Soup => "soup bowl",
    IceCream => "ice cream bowl",
    ChineseGreenBeans => "serving plate"
  }

  def initialize
    @dishes_needed = {}
  end

  def add(food)
    dish = FOOD_DISH_MAPPING[food.class]
    @dishes_needed[dish] = (@dishes_needed[dish] || 0) + 1
  end

  def dishes_needed
    return "None." if @dishes_needed.empty?

    @dishes_needed.map {|dish_name, count| "#{count} #{dish_name}" }.join(", ")
  end
end


d=DeliveryTray.new
d.add Soup.new; d.add Soup.new
d.add IceCream.new
puts d.dishes_needed # should be "2 soup bowl, 1 ice cream bowl"



#9.3 Behaviours

class Object
  def superclasses
    super_class = self.superclass
    result = []
    while !super_class.nil?
      result << super_class
      super_class = super_class.superclass
    end
    result
  end
end

class Bar
end

class Foo < Bar
end

p Foo.superclasses  # should be [Bar, Object, BasicObject]






# Solve the problem

# Whodunnit?
def location_in_hierarchy(object, method)
  klass = object.class
  ancestors = [klass]
  while not (superclass = klass.superclass).nil?
    ancestors << superclass
    klass = superclass
  end
  ancestors.reverse.find do |ancestor|
    ancestor.instance_methods.include?(method)
  end
end


# Compute sum of cubes for a given range
def sum_of_cubes(a, b)
  (a..b).inject(0) {|sum, num| sum + num**3}
end
