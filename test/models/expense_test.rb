require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase

	test "expense is not created without a concept" do
		expense = Expense.new(kind: "Withdrawal", category: "Education", amount: 500000)
		assert_not expense.save
	end

	test "expense is not created without a amount" do
		expense = Expense.new(kind: "Withdrawal", category: "Education", concept: "Withdrawal2")
		assert_not expense.save
	end

	test "expense is created normally" do
		expense = Expense.new(kind: "Transfer", category: "Home", concept: "Transfer1", amount: 100000)
		assert expense.save
	end

	test "one has the expected concept" do
		assert_equal "Payment1", expenses(:one).concept
	end

	test "delete an expense" do
	    assert_difference "Expense.count", -1 do
	      Expense.find_by(concept:"Payment1").destroy
	    end
	end 
end
