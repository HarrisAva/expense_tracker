class ExpensesController < ApplicationController
      before_action :authenticate_request, except: [:index]
    before_action :set_expense, only: [:show, :update, :destroy]
  
  
    def index
      #  expenses = Expense.all 
      # expenses = Expense.order(created_at: :desc)
      # render json: expenses, status: 200

      # display associated expense.category properties (name)
      expenses = Expense.includes(:category).order(created_at: :desc)
      render json: ExpenseBlueprint.render(expenses, view: :normal), status: :ok
    end

    def my_expenses
      expenses = @current_user.expenses.includes(:category).order(created_at: :desc)
      @total_expenses = expenses.sum(:amount)

      render json: ExpenseBlueprint.render(expenses, view: :normal), status: :ok

      # selected_month = params[:month]
      # selected_category = params[:category]

      # expenses_by_month = expenses.group_by { |expense| expense.date.strftime("%Y-%m")}
      # expenses_by_year = expenses.group_by { |expense| expense.date.year }

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

    # def expenses_by_category_by_month
    #   expenses = @current_user.expenses.select('categories.id as category_id, MONTH(date) as month, SUM(amount) as total_amount').joins(:category).group('categories.id, MONTH(date)')

    #   render json: expenses, status: :ok
    # end


    # def monthly_summary
    #   monthly_summary = @current_user.expenses.includes(:category).where(created_at: last_month.beginning_of_month..last_month.end_of_month).order(crated_at: :desc)

    #   total_expenses = expenses.sum(:amount)
      
    #   render json: monthly_summary, status: :ok

    # end
  
    def show
      @expense = Expense.find(params[:id])  # grab the id
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
  
  
  
