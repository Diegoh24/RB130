
require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @text_file = File.open('txt.txt')
    @text = Text.new(@text_file.read)
  end

  def test_swap
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected_text, @text.swap('a', 'e'))
  end

  def test_word_count
    word_count = 72
    assert_equal(word_count, @text.word_count)
  end

  def teardown
    @text_file.close
  end
end
