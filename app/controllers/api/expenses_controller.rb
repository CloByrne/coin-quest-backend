class Api::ExpensesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    def create
      @expense = Expense.new(expense_params)
  
      if @expense.save
        render json: @expense, status: :created
      else
        render json: @expense.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def expense_params
      params.require(:expense).permit(:total_cost, :number_of_people)
    end
  end
  