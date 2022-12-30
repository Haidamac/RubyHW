class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    @products = @category.products
    @breadcrumb = @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'category not found' }, status: :not_found
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end
