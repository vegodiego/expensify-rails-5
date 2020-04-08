class Api::V1::ExpensesController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    expenses = Expense.all
    render json: expenses, status: 200
  end

  def create
    expense = Expense.new(expense_params)
    if expense.save
      render json: expense, status: 201
    else
      render json: { errors: expense.errors }, status: 400
    end
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params)
      render json: expense, status: 200
    else
      render json: { errors: expense.errors }, status: 422
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    head 204
  end

  private
    def expense_params
      params.require(:expense).permit(:kind, :concept, :category, :amount) 
    end
end


