require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup

  end

  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    before = register.total_money
    register.accept_money(transaction)
    after = register.total_money

    assert_equal(before + 50 , after)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 100
    assert_equal(50, register.change(transaction))
  end

  def test_give_receipt
    item_cost = 35
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)
    assert_output("You've paid $#{item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end

  def test_prompt_for_payment
    transaction = Transaction.new(80)
    input = StringIO.new('100\n')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(100, transaction.amount_paid)
  end

  def teardown
  end
end
