require 'minitest/autorun'

class EmployeeTest < MiniTest::Test
  attr_reader :employee

  def setup
    @employee = 'me'
  end

  def test_exception
    assert_raises(NoExperienceError) {employee.hire}
  end
end