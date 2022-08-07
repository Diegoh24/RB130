def hello
  "hello!"
end

hello { puts "hi" }

def echo(str)
  yield if block_given?
  str
end

p echo("hi")

=begin
one of the major use cases of blocks:
-your method implemntation contains a 'yield', a developer using your method can come in after this method is fully implemented
and inject additional code in the middle of this method, without modifying the method implementation, by passing in a block of code.

=end