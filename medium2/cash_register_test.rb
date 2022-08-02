# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  attr_reader :cash_register, :transaction

  def setup
    @cash_register = CashRegister.new(0)
    @transaction = Transaction.new(5)
    transaction.amount_paid = 10
  end

  def test_accept_money
    cash_register.accept_money(transaction)
    assert_equal(10, cash_register.total_money)
  end

  def test_change
    assert_equal(5, cash_register.change(transaction))
  end

  def test_give_receipt
    assert_output("You've paid $5.\n") { cash_register.give_receipt(transaction) }
  end

  # def teardown
  # end
end