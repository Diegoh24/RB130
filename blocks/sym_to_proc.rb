=begin


=end


[1, 2, 3, 4].map do |num|
  num.to_s
end

# this kind of code is so common there is a shortcut:

[1, 2, 3, 4].map(&:to_s)

# this code iterates through every element in the array and calls the to_s on it, then saves the
# result into a new array. it returns a new array so you can chain another method like so:

[1, 2].map(&:to_s).map(&:to_i)
# note, the ampersand is followed by a symbol name of the method that can be invoked on each element
# the shortcut doesn't work for methods that take arguments
# this shortcut will work with any collection that takes a block

def my_method
  yield(2)
end

my_method(&:to_s)

a_proc = :to_s.to_proc
my_method(&a_proc)