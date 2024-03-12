class ExpensesController < ApplicationController
    before_action :authenticate_request, except: [:index]
    before_action :set_expense, only: [:show, :update, :destroy]
  
  
    def index
      #  expenses = Expense.all 
      expenses = Expense.order(created_at: :desc)
      render json: expenses, status: 200
    end

    def my_expenses
      expenses = @current_user.expenses.order(created_at: :desc)
      render json: ExpenseBlueprint.render(expenses, view: :normal), status: :ok
    end
  
    def show
      render json: @expense, status: :ok
    end
  
    def create
      #  expense = Expense.new(expense_params)
        expense = @current_user.expenses.new(expense_params)
  
      if expense.save
        render json: expense, status: :created
      else
        render json: expense.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if
        @expense.update(expense_params)
        render json: @expense, status: :ok
      else
        render json: @expense.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @expense.destroy
        render json: nil, status: :ok
      else
        render json: @expense.errors, status: :unprocessable_entity
      end
    end
   
    # def expenses_index
    #   user = User.find(params[:user_id])
    #   user_expenses = User.expenses
    #   user_expenses_sum = User.expenses.sum(:amount)
  
    #   render json: user_expenses, status: :ok
    # end
  
    private
    def set_expense 
       @expense = Expense.find(params[:id])
      # @current_user.expenses.find_by(id: params[id])
      # render json: { error: 'Expense not found' }, status: :not_found
      # unless @expense
    end
  
    def expense_params
      params.permit(:date, :title, :description, :amount, :category_id, :user_id)
    end
  end
  
  
  
