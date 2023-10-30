def solution(number)
  (1...number).to_a.select { |i| i % 3 == 0 || i % 5 == 0 }.sum
end