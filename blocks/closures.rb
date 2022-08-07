# def for_each_in(arr)
#   arr.each { |element| yield element }
# end

# arr = [ 1, 2, 3, 4, 5]

# results = [0]

# for_each_in(arr) do |number|
#   total = results[-1] + number
#   results.push(total)
# end


# p results

# when a method or block returns a closure. You can't return blocks, but you can return Proc objects

# def sequence
#   counter = 0
#   Proc.new { counter += 1 }
# end

# s1 = sequence
# p s1.call
# p s1.call
# p s1.call

# puts

# s2 = sequence
# p s2.call
# p s1.call
# p s2.call

=begin



=end
name = 'robert'

chunk = Proc.new { puts "hi #{name}"}

def call_me(some_code)
  some_code.call
end

name = "Griffin III"

call_me(chunk)