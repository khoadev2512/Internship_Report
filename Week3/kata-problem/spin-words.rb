def spin_words(string)
  string.split.map {|i| i.length >= 5 ? i.reverse : i }
end