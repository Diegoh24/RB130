require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  attr_reader :value

  def setup
    @value = nil
  end

  def test_boolean
    assert_nil value
  end
end