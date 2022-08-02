require 'minitest/autorun'

class ArrayObject < MiniTest::Test
  attr_reader :list

  def setup
    @list = []
    list << 'xyz'
  end

  def test_empty
    assert_includes list, 'xyz'
  end
end