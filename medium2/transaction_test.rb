
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    @transaction = Transaction.new(5)
    input = StringIO.new("10\n")
    output = StringIO.new

    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(10, @transaction.amount_paid)
  end
end