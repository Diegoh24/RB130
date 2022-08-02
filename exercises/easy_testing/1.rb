require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  attr_reader :value

  def setup
    @value = 5
  end

  def test_boolean
    assert_equal(true, value.odd?)
  end
end