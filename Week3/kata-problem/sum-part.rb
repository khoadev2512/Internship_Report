def parts_sums(ls)
  result = [ls.sum] * ls.length
  result.each_with_index { |sum,i| result[i] = result[i-1] - ls[i-1] if i != 0}
  result << 0
end