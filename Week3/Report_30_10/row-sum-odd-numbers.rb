# frozen_string_literal: true

def row_sum_odd_numbers(n)
  sum = 1
  num.times do |i|
    sum += 2*i
  end
  sum * num + (sum-1)
end
