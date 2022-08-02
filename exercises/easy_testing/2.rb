require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  attr_reader :value

  def setup
    @value = 'xYz'
  end

  def test_boolean
    assert_equal 'xyz', value.downcase
  end
end