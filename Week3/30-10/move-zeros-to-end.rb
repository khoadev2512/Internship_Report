def moveZeros(arr) 
  #You can do it! :)
  arr.filter { |e| !e.zero? } + [0] * arr.count(0) 
enda