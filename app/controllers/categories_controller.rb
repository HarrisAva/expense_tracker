class CategoriesController < ApplicationController
  before_action :authenticate_request, except: [:index]

  def index
    categories = Category.all
    render json: categories, status: 200
  end

  def show
    render json: @category, status: :ok
  end

  private
    def set_category 
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.permit(:id, :name, :expense_id, :user_id)
    end
end
