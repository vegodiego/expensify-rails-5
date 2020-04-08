require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL 
  Capybara.current_driver = :selenium_chrome
 
  test "create expense" do
    assert_difference 'Expense.count', 1 do
      visit "/expenses"
      click_on "New Expense"      
      fill_in "expense_concept", with: "nuevo expense"
      fill_in "expense_amount", with: "1000"
      click_on "Create expense"
    end
  end 
  
end