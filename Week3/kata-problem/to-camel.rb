# frozen_string_literal: true

def to_camel_case(str)
  words = str.split(/[-_]/)
  result = words.shift
  words.each do |word|
    word[0] = word[0].upcase
    result << word
  end
  result
end
