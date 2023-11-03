# Blocks

#0.0
Addition = lambda {|a, b| return a + b } # use this as your example!
Subtraction = lambda {|a, b| return a - b } # your code between the braces
Multiplication = lambda {|a, b| return a * b } # your code between the braces
Division = lambda {|a, b| return a / b } # your code between the braces



#1.1
def is_ancestor?(klass, subclass)
  cur = subclass
  while !cur.superclass.nil? && cur != klass
    cur = cur.superclass
  end
  cur == klass
end



#2.2
class Item

  attr_reader :item_name, :quantity, :supplier_name, :price

  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end

  def ==(other)
    @item_name == other.item_name &&
    @quantity == other.quantity &&
    @supplier_name == other.supplier_name &&
    @price == other.price
  end

  def eql?(other)
    self == other
  end

  def hash
    @item_name.hash ^ @quantity.hash ^ @supplier_name.hash ^ @price.hash
  end
end





 #2.4
require 'yaml'
require 'psych'

class Ogre
  attr_accessor :strength, :speed, :smell
  def initialize(strength, speed, smell)
    @strength = strength
    @speed = speed
    @smell = smell
  end
end

class Dragon
  attr_accessor :strength, :speed, :color
  def initialize(strength, speed, color)
    @strength = strength
    @speed = speed
    @color = color
  end

  # def encode_with(coder)
  #   coder['strength'] = @strength
  #   coder['speed'] = @speed
  #   coder['color'] = @color
  # end

  # def init_with(coder)
  #   @strength = coder['strength']
  #   @speed = coder['speed']
  #   @color = coder['color']
  # end
end


class Fairy
  attr_accessor :strength, :speed, :intelligence
  def initialize(intelligence)
    @strength = 1
    @speed = 42
    @intelligence = intelligence
  end
end


# Store instances in a hash
characters = {
  ogres: Ogre.new(10, 5, "bad"),
  dragons: Dragon.new(50, 8, "red"),
  fairies: Fairy.new("smart")
}

# Save all character instances to a YAML file
def save_game(characters)
  yaml = YAML.dump(characters)
  File.open("/home/khoanv/saved.yaml", "w") { |file| file.write(yaml) }
end

# Load all character instances from the YAML file
def load_game
  yaml = File.read("/home/khoanv/saved.yaml")
  YAML.safe_load(yaml, permitted_classes: [Ogre, Dragon, Fairy, Symbol])
end

# Save the game data
save_game(characters)

# Load the game data and print it
loaded_characters = load_game
puts loaded_characters[:ogres].strength
puts loaded_characters[:dragons].color
puts loaded_characters[:fairies].intelligence




# 3.0
def compute(ary)
  ary.map {|a,b| !b.nil? a + b: a}
end


def median(*list)
  mid = list.length / 2

  if list.length.odd?
    list[mid]
  else
    (list[mid - 1] + list[mid]).to_f / 2.0
  end
end



#4.2
module Foo
  module ClassMethods
    def guitar
      "gently weeps"
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end

class Bar
  include Foo
end

puts Bar.guitar


#5.1
EXAMPLE_SECRETS = ["het", "keca", "si", nil, "iel"]

def decode(jumble)
  secret = jumble.split("").rotate(3).join("")
  announce(secret)
  secret
end

begin
  EXAMPLE_SECRETS.each {|i| decode(i)}
rescue Exception => e
  puts e
end
