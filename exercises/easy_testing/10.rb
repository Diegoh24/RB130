require 'minitest/autorun'

class ArrayObject < MiniTest::Test
  attr_reader :list

  def setup
    @list = []
    list << 'xyZ'
  end

  def test_include
    refute_includes list, 'xyz'
  end
end

