def more_zeros(s)
  result = []
  s.each_cha r do |i|
    tmp = i.unpack("B*").first
    result << i if tmp.count("0") - 1 > tmp.count("1")
  end
  result.uniq.select {|e| e.to_i.zero? && e != "#" && e != ',' && e != "&" && e != '%' && e != '*' && e != ')'}
end
