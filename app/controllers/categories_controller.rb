class CategoriesController < ApplicationController
  before_action :authenticate_request, except: [:index]
  before_action :set_category, only: [:show, :update, :destroy]
  def index
    categories = Category.all
    render json: CategoryBlueprint.render(categories), status: :ok
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
