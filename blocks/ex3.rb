# def say(words)
#   yield if block_given?
#   puts ">" + words
# end

# say("hi there") do
#   system 'clear'
# end

# =begin
# 1. excecution starts at method invocation, on line 6. The 'say' method is invoked with 2 arguments : a string and a block
# -the block is an implicit parameter and not part of the method definition
# 2. Execution goes to line 1, where the method local variable 'words' is assigned to the string 'hi there'.
# The block is passed implicitly without being assigned to a variable.
# 3. Execution continues into the first line of the method implementation, line 2, which immediately yields to the block.
# 4. The block, line 7, is now executed, clearing the screen.
# 5. After the block is done executing, execution continues in the method implementation on line 3. Executing line 3 results in output
# being displayed.
# 6. The method ends, which means the last expression's value is returned by this method. The last expression in the method
# invokes the 'puts' method, so the return value for the method is nil.

# So the execution went like so:
# line 6 > line 1 > line 2 > line 7 > line 3 > line 4

# after line 2, execution jumps to somewhere else, then comes back to finish the rest of the method.
# This is similar to calling a method, but here you are calling a block.
# This is why its sometimes useful to think of a block as an un-named or anonymous method.


# =end

# def increment(number)
#   yield(number + 1) if block_given?
#   number + 1
# end

# increment(5) do |num|
#   puts num
# end

# =begin
# Execution starts at method invocation on line 37.

# Execution moves to the method implementation on line 32, which sets 5 to the local variable
# 'number', and the block is not set to any variable; it's just implicitly available

# Execution continues on line 33, which is a conditional

# The method invocation passed in a block, so the conditional is true, yielding execution to the block (or the block is called)
# and you pass in 'number + 1' to the block. So you call the block with 6 as the block argument.

# Execution jumps to line 37, where the block local variable num is assigned to 6.

# Execition continues on line 38, where you output the block local variable 'num'

# Execution continues to line 39, where the end of the block is reached.

# Execution now jumps back to the method implementation, where you just finished executing line 33.

# Execution continues to line 34, returning the value of the incremented argument to line 37.

# The program ends (the return value of #increment is not used

# EXECUTION FLOW:
# line 37 > line 32 > line 33 > line 37 > line 38 > line 39 > line 33 > line 34 > line 35 > line 37


# =end

# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After:#{after}" #extra space
# end

# compare('hi') { |word| puts "hi" }


def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :downcase
            str.downcase
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

p compare("hello", :upcase)
