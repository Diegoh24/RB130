require 'minitest/autorun'

class EmptyObject < MiniTest::Test
  attr_reader :list

  def setup
    @list = []
  end

  def test_empty
    assert_empty list
  end
end