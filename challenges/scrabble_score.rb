=begin
write a program
-given a word
-computes the scrabble score for that word.

use letter values

-given a string, iterate over each char
-append to a sum the corresponding value pair of the char

-words are case insesitive, return nil if no string

=end

class Scrabble
  attr_reader :word

  VALUES = { %w(a e i o u l n r s t) => 1,
             %w(d g) => 2,
             %w(b c m p) => 3,
             %w(f h v w y) => 4,
             %w(k) => 5,
             %w(j x) => 8,
             %w(q z) => 10 }

  def initialize(string)
    @word = valid?(string) ? string.downcase : []
  end

  def valid?(word)
    word && word.match?(/[a-z]/i)
  end

  def score
    return 0 unless valid?
    word.downcase.chars.inject(0) { |sum, char| sum + value(char) }
  end

  def value(letter)
    VALUES.each { |letters, val| return val if letters.include?(letter) }
  end

  def self.score(one_time)
    Scrabble.new(one_time).score
  end
end
