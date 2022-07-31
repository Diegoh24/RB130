# implement a reduce method similar to Enumerable#reduce
=begin
reduce is another name for the inject method, and its main goal is to fold or accumulate a collection into 1 object.
What the specific folding or accumulation mechanism is depends on the code passed in to the block.



[1, 2, 3].reduce { |acc, num| acc + num }

the array is the caller, the `reduce` is the method call, and the `{...}` is the block.
The reduce method iterates through the array and unlike each, where it only yields 1 argument to the block,
the reduce method yields two arguments to the block.
The first argument is an accumulator object, and the second argument is the current element.

The return value of the block is then assigned to the accumulator object.

Remember, the `reduce` or `inject` method sets the accumulator to the return value of the block, and then passes
the accumulator to the block on the next yield. When it got to `2`, the line `acc + num if num.odd?` returned `nil`.
The accumulator is now set to `nil` and the next time `reduce` yielded to the block, the accumulator was passed to the block.

Another interesting behavior for the Enumerable#reduce method is that you can initialize the accumulator to
a default value. For example, let's say we wanted to add up all the elements of an array, but we wanted to start
the accumulator from 10 :
[1, 2].reduce(10) { |accumulator, num| accumulator + num }
#=> 13
This initialize the accumulator object from 10, so each iteration through the array will add the current element to the
accumulator, then set the accumulator to the return value of the block.

your `reduce` method should take at leasy 1 argument that represents the array you'll operate on. It should also
take an additional second argument that represents the default value for the accumulator
=end

# def reduce(array, accumulator = 0)
#   idx = 0

#   while idx < array.size
#     accumulator = yield(accumulator, array[idx])
#     idx += 1
#   end

#   accumulator
# end




# array = [1, 2, 3, 4, 5]

# reduce(array) { |acc, num| acc + num }                    # => 15
# reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }


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