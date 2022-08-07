=begin
-take a string of digits
-return all the possible consecutive number series of a specified length in that string

-e.g given the string '01234'
-has the following 3-digit number series : 012, 234, 123
-has the following 4-digit number series: 0123, 1234
-error is ask for a longer number series than digits in string


-create a substring of all the x digit(size) strings in the string,

=end


class Series
  attr_reader :digits

  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(dig)
    raise ArgumentError.new if dig > digits.size
    digits.each_cons(dig).to_a
  end
end