# frozen_string_literal: true

# Product of consecutive Fib numbers
def productFib(prod)
  a = 0
  b = 1
  a, b = [b, a + b] while prod > a * b
  [a, b, prod == a * b]
end

# Rot13
def rot13(string)
  string.tr('a-zA-Z', 'n-za-mN-ZA-M')
end

# First non-repeating character (5kyu)
def  first_non_repeating_letter(str)
  rs = str.chars.find { |i| str.downcase.chars.count(i.downcase) < 2 }
  rs.nil? ? '' : rs
end

# Weight for weight (5kyu)
def order_weight(strng)
  sorted = strng.split.sort do |a, b|
    rs = a.chars.sum(&:to_i) <=> b.chars.sum(&:to_i)
    rs.zero? ? (a <=> b) : rs
  end
  sorted.join(' ')
end

# Extract the domain name from a URL
def domain_name(url)
  regex = %r{(http|https)://(?:www\.)?(?<domain_name>.*?)\.}
  url.match(regex)[:domain_name]
end

# String incrementer
def increment_string(input)
  non_numeric_part, numeric_part = input.match(/^(.*?)(\d*)$/).captures

  return "#{non_numeric_part}1" if numeric_part.empty?

  incremented_numeric_part = (numeric_part.to_i + 1).to_s.rjust(numeric_part.length, '0')
  "#{non_numeric_part}#{incremented_numeric_part}"
end
