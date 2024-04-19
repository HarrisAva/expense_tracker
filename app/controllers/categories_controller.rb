class CategoriesController < ApplicationController
  before_action :authenticate_request, except: [:index]

  def index
    categories = Category.all
    render json: categories, status: 200
  end

  def show
    render json: @category, status: :ok
  end

  def create
    category = Category.new(category_params)

  if category.save
    render json: category, status: :created
  else
    render json: category.errors, status: :unprocessable_entity
  end
end

  private
    def set_category 
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.permit(:name)
    end
end
