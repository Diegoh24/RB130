=begin
octal to decimal conversion
given an octal input string
produce a decimal output
treat invalid input as octal 0.

decimal is a base 10 system.



so,
233
= 2 x ( 10 ^2) = 200
= 3 x ( 10^1) = 30
= 2 x (10 ^0) = 2

233 in base 8 can be understood as a linear combination of powers of 8
= 2 x (8 ^ 2) = 128
= 3 x (8 ^ 1) = 24
= 3 x (8 &0 ) = 3

if the string contains other characters, not numbers, octal is assigned to 0
invalid input get treated as octal 0

to_decimal method
at instantiation, assign
convert the decimal to a string
-check to see if number is valid
-ensure that the number has only digits.

-iterate over each character in the string
convert it to base 8
=end

class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid?
    decimal = 0
    number.to_i.digits.each_with_index { |digit, idx| decimal += digit * (8 ** idx)}
    decimal
  end

  def valid?
    number.match(/^[0-7]+$/)
  end
end

p Octal.new('1').to_decimal
# p Octal.new('10').to_decimal
# p Octal.new('20fsa').to_decimal
# p Octal.new('dasdas').to_decimal