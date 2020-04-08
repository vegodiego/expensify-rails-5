require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  test "get index: is successful" do
    get expenses_path
    assert_response :success
  end

  test "expense create: creates an expense" do
    assert_difference "Expense.count", 1 do
      post expenses_path, params: { expense: { kind: "Transfer", category: "Home", concept: "Transfer1", amount: 100000 } }

      assert_redirected_to expenses_path
    end
  end

  test "expense update: update an expense" do
    expense = expenses(:one)
    patch expense_path(expense), params: { expense: { amount: 200000 } }

    expense.reload
    assert_equal 200000, expense.amount
  end

  test "should destroy article" do
    expense = expenses(:one)
    assert_difference('Expense.count', -1) do
      delete expense_path(expense)

      assert_redirected_to expenses_path
    end
  end

end

