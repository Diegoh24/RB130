class RomanNumeral
  attr_reader :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman = ''
    while number > 0
      roman << next_largest
    end
    roman
  end

  def next_largest
    ROMAN_NUMERALS.each do |roman, value|
      if number >= value && number / value > 0
        @number -= value
        return roman
      end
    end
  end

end

# a = RomanNumeral.new(4)
# p RomanNumeral.new(448).to_roman
# p RomanNumeral.new(9).to_roman
# p b.to_roman
# =begin
# numbers are represented with letters
# numbers are written from left to right, with
# the largest base being on the left
# if the number is within the range of n - m (previous letter in value),
# it should be represented as mn

# class RomanNumeral
#   attr_accessor :number

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version += (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end