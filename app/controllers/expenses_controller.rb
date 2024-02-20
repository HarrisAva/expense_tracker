class ExpensesController < ApplicationController
    before_action :authenticate_request, only: [:index, :show, :update, :destroy]
    before_action :set_user, only: [:show, :update, :destroy]
  
  
    def index
      expenses = Expense.all 
  
      render json: expenses, status: 200
    end
  
    def show
      @expense = Expense.find(params[:id])
  
       render json: UserBlueprint.render(@expense, view: :normal), status: 200
    end
  
    def create
      # user = Expense.create(expense_params)
      user = @current_user.expenses.new(expense_params)
  
      if expense.save
        render json: user, status: :created
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
   
  #   def expenses_index
  #     user = User.find(params[:user_id])
  #     user_expenses = User.expenses
  
  #     render json: user_expenses, status: :ok
  #   end
  
    private
    def set_expense 
      @expense = Expense.find(params[:id])
    end
  
    def expense_params
      params.permit(:date, :title, :description, :amount, :category)
    end
  end
  
  
  
