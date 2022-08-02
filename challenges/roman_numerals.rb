# class RomanNumeral
#   attr_reader :number
#   VALUES = { 'I' => 1, 'V' => 5,
#             'X' => 10, 'L' => 50,
#             'C' => 100, 'D' => 500,
#             'M' => 1000 }

#   LETTERS = %w(I V X L C D M).reverse

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman = ''

#     while @number > 0
#       next_roman = largest_roman
#       p number if next_roman == 'VX'

#       roman << next_roman
#       @number -= (next_roman.size == 2 ? VALUES[next_roman[1]] - VALUES[next_roman[0]] : VALUES[next_roman])
#     end

#     roman
#   end

#   def largest_roman
#     LETTERS.each_with_index do |roman, idx|
#       value = VALUES[roman]
#       ok = value - VALUES[LETTERS[idx + 1]]

#       #p number, ok if roman == 'X'
#       if number >= value && number % value > 0
#         return roman
#       elsif number / ok > 0
#         return LETTERS[idx + 1] + roman
#       elsif number <= 3
#         return 'I'
#       end
#     end
#   end

# end


# # a = RomanNumeral.new(4)
# b = RomanNumeral.new(448)
# p RomanNumeral.new(9).to_roman
# p b.to_roman
# =begin
# numbers are represented with letters
# numbers are written from left to right, with
# the largest base being on the left
# if the number is within the range of n - m (previous letter in value),
# it should be represented as mn

class RomanNumeral
  attr_accessor :number

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
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end