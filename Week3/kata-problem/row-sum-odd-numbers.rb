# frozen_string_literal: true

def row_sum_odd_numbers(n)
  sum = 1
  n.times do |i| 
    sum += 2*i
  end
  sum * n + (sum-1)
end