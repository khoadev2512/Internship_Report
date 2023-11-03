# frozen_string_literal: true

# Tic-Tac-Toe Checker  (5kyu)
def solved?(boards)
  return -1 if boards.flatten.include?(0)

  3.times do |i|
    return boards[i][0] if boards[i].uniq.size == 1
    return boards[0][i] if boards[0][i] == boards[1][i] && boards[1][i] == boards[2][i]
  end

  return boards[0][0] if boards[0][0] == boards[1][1] && boards[1][1] == boards[2][2]
  return boards[0][2] if boards[0][2] == boards[1][1] && boards[1][1] == boards[2][0]

  0
end

# Mean Square Error  (5kyu)
def solution(arr1, arr2)
  arr1.zip(arr2).map { |arr| (arr.first - arr.last)**2 }.sum / arr1.size.to_f
end

# Sum of Pairs  (5kyu)
def sum_pairs(integers, sum)
  seen = {}

  integers.each do |num|
    complement = sum - num
    return [complement, num] if seen.key?(complement)

    seen[num] = true
  end

  nil # No pair found
end

# Best travel  (5kyu)
def choose_best_sum(max_miles, num, lists)
  possible_combinations = lists.combination(num).to_a
  sums = possible_combinations.map(&:sum)
  valid_sums = sums.select { |sum| sum <= max_miles }
  valid_sums.max
end

# Josephus Permutation  (5kyu)
def josephus(items, count)
  result = []
  idx = 0
  until items.empty?
    idx = (idx + count - 1) % items.length
    result << items.delete_at(idx)
  end
  result
end

# Convert A Hex String To RGB  (5kyu)
def hex_to_rgb(str)
  result = []
  str[1..].chars.each_slice(2) { |char| result << char.join.to_i(16) }
  { r: result[0], g: result[1], b: result[2] }
end

# Human readable duration format (5kyu)
def format_duration(seconds)
  return 'now' if seconds.zero?

  units = [
    ['year', 365 * 24 * 60 * 60],
    ['day', 24 * 60 * 60],
    ['hour', 60 * 60],
    ['minute', 60],
    ['second', 1]
  ]
  result = []
  units.each do |unit, value|
    next unless seconds >= value

    count = seconds / value
    result << "#{count} #{unit}#{count > 1 ? 's' : ''}"
    seconds %= value
  end
  result.join(', ').sub(/,([^,]+)$/, ' and\1')
end
