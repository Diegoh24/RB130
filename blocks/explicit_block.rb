def test2(block)
  puts "hello"
  block.call
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { |pre| puts "xyz" }

# notice how you only have to use the & for the block paramter in test
# since block is already a Proc object when you call test2, no conversion is needed

=begin
also note, the &parameter_name converts the block to a Proc object
within the method implementation, you can refernce the paramter_name without prepending the &
=end

#you use block.call inside test2 to invoke the Proc instead of yield.
# it's not common, but the need to pass a block around like this will occur


#You can also pass arguments to the explicit block by using them as arguments to call
def display(block)
  block.call(">>>")
end

def test(&block)
  puts "1"
  display(block)
  puts "2"
end

test { |prefix| puts prefix + "xyz" }

