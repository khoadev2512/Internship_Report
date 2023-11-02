# frozen_string_literal: true

def scramble(s1, s2)
  char_count1 = Hash.new(0)
  char_count2 = Hash.new(0)

  s1.chars.each { |char| char_count1[char] += 1 }
  s2.chars.each { |char| char_count2[char] += 1 }

  char_count2.all? { |char, count| count <= char_count1[char] }
end