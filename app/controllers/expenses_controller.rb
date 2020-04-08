class ExpensesController < ApplicationController
  
  def index
    @expenses=Expense.all
    @expense1=Expense.new
  end

  def create
    expense = Expense.new(expense_params)
    if expense.save
      redirect_to expenses_path, notice: "The expense was successfully created"
    end
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "The expense was successfully modified"
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy

    redirect_to expenses_path, notice: "The expense was successfully removed"
  end
  
  private
    def expense_params
      params.require(:expense).permit(:kind, :concept, :category, :amount) 
    end

end
