=begin
iterates over the member of a collection, taking each sequence of 'n' consecutive elements at a time and passing
them to the associated block for processing.
Returns a value of nil.



=end

def each_cons(array)
  array[0..-2].each_with_index { |num, idx| yield(num, array[idx + 1]) }
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil