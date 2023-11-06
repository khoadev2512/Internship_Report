# frozen_string_literal: true

# Strip Comments  (4kyu)
def solution(input, markers)
  input.split("\n").map! do |line|
    idx = -1
    line.chars.each_with_index do |char, i|
      if markers.include?(char)
        idx = i - 2
        break
      end
    end
    line[0..idx]
  end.join("\n")
end

# Find the odd int  (6kyu)
def find_it(seq)
  seq.find { |num| seq.count(num).odd? }
end

# Convert PascalCase string into snake_case (5kyu)
def to_underscore(string)
  string.to_s.split(/(?=[A-Z])/).join('_').downcase
end

# Factorial decomposition (5kyu)
def decomp(num)
  require 'prime'
  factorial = (1..num).inject(:*)
  Prime.prime_division(factorial).map { |part| part[1] > 1 ? part.join('^') : part[0] }.join(' * ')
end

# Beeramid (5kyu)
def beeramid(bonus, price)
  cur = 0
  level = 0
  while cur < bonus / price
    cur += (level + 1)**2
    level += 1 if cur <= bonus / price
  end
  level
end

# Gap in Primes (5kyu)
def gap(gap, min, max)
  require 'prime'
  previous_prime = nil
  (min..max).each do |num|
    if Prime.prime?(num)
      return [previous_prime, num] if previous_prime && num - previous_prime == gap

      previous_prime = num
    end
  end
  nil
end

# Last digit of a large number  (5kyu)
def last_digit(base, exponent)
  return 1 if exponent.zero?

  case exponent % 4
  when 0
    last_digit = (base**4) % 10
  when 1
    last_digit = base % 10
  when 2
    last_digit = (base**2) % 10
  when 3
    last_digit = (base**3) % 10
  end
  last_digit
end

# int32 to IPv4 (5kyu)
def int32_to_ip(int_value)
  ip_parts = []

  4.times do
    ip_parts.unshift(int_value & 255)
    int_value >>= 8
  end

  ip_parts.join('.')
end
