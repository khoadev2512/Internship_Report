#!/home/khoanv/.rvm/rubies/ruby-3.2.2/bin/ruby

def sort_string(string)
  string.split(' ').sort{|x, y| x.length <=> y.length}.join(' ')
end

p sort_string("Sort words in a sentence")

