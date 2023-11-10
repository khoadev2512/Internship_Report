# frozen_string_literal: true

# Count IP Addresses   (5kyu)
def ip_to_int(ip)
  ip.split('.').map(&:to_i).reduce(0) { |acc, octet| (acc << 8) + octet }
end

# Count IP Addresses   (5kyu)
def ips_between(start_ip, end_ip)
  start_int = ip_to_int(start_ip)
  end_int = ip_to_int(end_ip)
  end_int - start_int
end

# Not very secure			 (5kyu)
def alphanumeric?(str)
  !str.empty? && str.match?(/^[A-Za-z0-9]+$/) && !str.match?(/[ _]/)
end

# Rot13			(5kyu)
def rot13(text)
  text.tr('A-Za-z', 'N-ZA-Mn-za-m')
end

# Memoized Fibonacci		(5kyu)
def fibonacci(number)
  cache = {}
  fib = lambda do |num|
    return num if (0..1).include?(num)
    return cache[num] if cache.key?(num)

    result = fib.call(num - 1) + fib.call(num - 2)
    cache[num] = result
    result
  end
  fib.call(number)
end

# What's a Perfect Power anyway?	(5kyu)
def pp?(num)
  max_m = Math.sqrt(num).to_i
  (2..max_m).each do |m|
    k = Math.log(num, m).round
    return [m, k] if m**k == num
  end
  nil
end

# Common Denominators   (5kyu)
def gcd(numa, numb)
  numb.zero? ? numa : gcd(numb, numa % numb)
end

def lcm(numa, numb)
  (numa * numb) / gcd(numa, numb)
end

def convert_fracts(lst)
  common_denominator = lst.reduce(1) { |acc, (_, denom)| lcm(acc, denom) }

  lst.map do |numer, denom|
    numerator = numer * (common_denominator / denom)
    [numerator, common_denominator]
  end
end

# ISBN-10 Validation    (5kyu)
def valid_isbn10(isbn)
  return false if isbn.length != 10 || !isbn[0..8].match?(/\A\d+\z/) || !%w[0 1 2 3 4 5 6 7 8
                                                                            9 X].include?(isbn[9])

  sum = 0
  isbn.each_char.with_index(1) do |digit, position|
    value = digit == 'X' ? 10 : digit.to_i
    sum += value * position
  end

  (sum % 11).zero?
end
