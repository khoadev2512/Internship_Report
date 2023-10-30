# frozen_string_literal: true

def find_outlier(integers)
  integers.one? {|i| i.even?} ? integers.find {|i| i.even?} : integers.find {|i| i.odd?}
end