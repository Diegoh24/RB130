# write a select method that mirrors Array#select
# your method takes a block, then yields each element to the block. If the block evaluates as true,
# the current element will be included in the returned array. If this block evaluates to false,
# the current element is not included

def select(array)
  idx = 0
  new_array = []

  while idx < array.size
    current_element = array[idx]
    new_array << current_element if yield(current_element)
    idx += 1
  end

  new_array
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }