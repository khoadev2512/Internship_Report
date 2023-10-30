# frozen_string_literal: true

def splitInteger(num, parts)
  div = num / parts
  remain = num % parts
  [div + 1] * remain + [div] * (parts - remain)
end
