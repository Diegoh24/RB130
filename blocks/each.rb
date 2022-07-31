def each(array)
  idx = 0

  while idx < array.size
    yield(array[idx])
    idx +=  1
  end

  p array
end

each([1,2,3]) { |num| puts num }