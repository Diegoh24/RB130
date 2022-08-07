=begin
create a new enumerator object
upon instantiation, you may define what values are iterated upon

Create an enumerator that can iterate over an infinite list of of factorials
test, by printing out the first 7 factorial values

print the first 7 factorials by using an external iterator.
See what happens if you print 3+ factorials.
Reset your enumerator.

reset your enumerator with the rewind method


=end


factorial = Enumerator.new do |y|
  fac = 1

  1.upto(10) do |current_factorial|
    y << fac *= current_factorial
    puts "Number:#{current_factorial} | #{current_factorial}! = #{fac}"
  end

  y
end

p factorial.take(10)
