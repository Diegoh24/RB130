
def reduce(array, accumulator = nil)
  idx = 1
  accumulator = array.first

  while idx < array.size
    accumulator = yield(accumulator, array[idx])
    idx += 1
  end

  p accumulator
end


reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value }