class Anagram
  attr_reader :target_word

  def initialize(word)
    @target_word = word.downcase
  end

  def match(words)
    words.select { |word| anagram?(word.downcase) }
  end

  private

  def anagram?(word)
    same_chars?(word) && word != target_word
  end

  def same_chars?(word)
    target_word.chars.sort.join == word.downcase.chars.sort.join
  end
end

