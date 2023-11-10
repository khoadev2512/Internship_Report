# frozen_string_literal: true

# Scamble it  (5kyu)
def scramble(str1, str2)
  char_count1 = Hash.new(0)
  char_count2 = Hash.new(0)

  str1.chars.each { |char| char_count1[char] += 1 }
  str2.chars.each { |char| char_count2[char] += 1 }

  char_count2.all? { |char, count| count <= char_count1[char] }
end

# Greed is Good  (5kyu)
def score(dice)
  result = 0
  triple = dice.find { |i| dice.count(i) >= 3 }
  (result += triple == 1 ? 1000 : triple * 100) unless triple.nil?
  result + (triple == 1 ? dice.count(1) - 3 : dice.count(1)) * 100 + (triple == 5 ? dice.count(5) - 3 : dice.count(5)) * 50
end

# Number of trailing zeros of N!  (5kyu)
def zeros(num)
  count = 0
  while n >= 5
    num /= 5
    count += num
  end
  count
end

# When The Sum of The Divisors Is A Multiple Of The Prime Factors Sum  (5kyu)
def ds_mult_of_pfs(min, max)
  require 'prime'
  (min..max).select do |number|
    primes = number.prime_division.flat_map { |p, num| [p] * num }
    prime_sum = primes.sum
    divisor_sum = (1..primes.size).map { |num| primes.combination(num).uniq.map { |pa| pa.reduce(&:*) } }.flatten.sum + 1
    (divisor_sum % prime_sum).zero?
  end
end

# Perimeter of squares in a rectangle  (5kyu)
def perimeter(num)
  fibo_list = [0, 1]
  fibo = lambda do |i|
    return fibo_list[i] unless fibo_list[i].nil?

    num = fibo.call(i - 2) + fibo.call(i - 1)
    fibo_list[i] = num
  end
  rs = (1..num + 1).inject(0) { |sum, i| sum + fibo.call(i) }
  rs * 4
end

# Primes in numbers  (5kyu)
def prime_factors(num)
  require 'prime'
  result = ''
  Prime.prime_division(num).each { |i| result += "(#{i[0]}#{i[1] == 1 ? '' : "**#{i[1]}"})" }
  result
end

# Integers: Recreation One  (5kyu)
def list_squared(min, max)
  result = []
  (min..max).to_a.each do |i|
    sum_square = (1..i).select { |x| (i % x).zero? }.sum { |num| num**2 }
    result << [i, sum_square] if Math.sqrt(sum_square).to_i == Math.sqrt(sum_square)
  end
  result
end

# Pick peaks  (5kyu)
def pick_peaks(arr)
  plateaus = -1
  peaks = []
  pos = []
  (1..arr.length - 2).each do |i|
    if arr[i] > arr[i + 1] && arr[i] > arr[i - 1]
      peaks << arr[i]
      pos << i
    elsif arr[i] > arr[i - 1] && arr[i] == arr[i + 1]
      plateaus = i
    elsif arr[i] == arr[i - 1] && arr[i] > arr[i + 1] && plateaus.positive?
      peaks << arr[i]
      pos << plateaus
      plateaus = -1
    end
  end
  { 'pos' => pos, 'peaks' => peaks }
end

# Is my friend cheating?  (5kyu)
def remove_nb(max)
  result = []
  arr = (1..max).to_a
  (1..max).to_a.each do |num|
    tmp = arr.reverse.find { |i| (arr.sum - num - i == num * i) && i > num }
    result << [num, tmp] unless tmp.nil?
  end
  result.flat_map { |i| [i, i.shuffle] }
end

# PaginationHelper  (5kyu)
class PaginationHelper
  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  # returns the number of items within the entire collection
  def item_count
    @collection.count
  end

  # returns the number of pages
  def page_count
    rs = item_count / @items_per_page
    (item_count % @items_per_page).zero? ? rs : rs + 1
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    return -1 if page_index.negative? || page_index >= page_count

    page_index + 1 < page_count ? @items_per_page : item_count % @items_per_page
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    return -1 if item_index.negative? || item_index + 1 > item_count

    (1..page_count).each do |i|
      return i - 1 if item_index + 1 <= i * @items_per_page
    end
  end
end
