class ExpensesController < ApplicationController
    before_action :authenticate_request, except: [:index]
    before_action :set_expense, only: [:show, :update, :destroy]
  
    def index
      expenses = Expense.includes(:category).order(created_at: :desc)
      render json: ExpenseBlueprint.render(expenses, view: :normal), status: :ok
    end

    def my_expenses
      expenses = @current_user.expenses.includes(:category).order(created_at: :desc)
      @total_expenses = expenses.sum(:amount)

      render json: ExpenseBlueprint.render(expenses, view: :normal), status: :ok

    end

    def expenses_by_category
      expenses = @current_user.expenses.all.includes(:category)
      expenses_by_category = expenses.group_by { |expense| expense.category.name }
      
      result = expenses_by_category.map do |category, expenses|
        total_amount = expenses.sum(&:amount)
        { category: category, total_amount: total_amount }
      end

      render json: result, status: :ok
    end

    def expenses_by_category_and_month
      expenses = @current_user.expenses.find(param[:month]).includes(:category)
      expenses_by_category_and_month = expenses.group_by { |expense| [expense.category.name, expense.date.strftime("%B %Y")] }
      
      result = expenses_by_category_and_month.map do |category, expenses|
        total_amount = expenses.sum(&:amount)
        { category: category, total_amount: total_amount }
      end

      render json: result, status: :ok

    end

    def total_amount
      expenses = @current_user.expenses.includes(:category)
      total_amount = expenses.sum(:amount)
      render json: { total_amount: total_amount}
    end

    def show
      @expense = Expense.find(params[:id])  # grab the id
      render json: @expense, status: :ok
    end
  
    def create
        expense = @current_user.expenses.new(expense_params)
  
      if expense.save
        render json: expense, status: :created
      else
        render json: expense.errors, status: :unprocessable_entity
      end
    end
  
    def update
       @expense = Expense.find(params[:id])
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

    private
    def set_expense 
       @expense = Expense.find(params[:id])

    end
  
    def expense_params
      params.permit(:date, :title, :description, :amount, :category_id, :user_id)
    end
  end
