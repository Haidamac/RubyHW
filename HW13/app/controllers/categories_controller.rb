# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @products = @category.products
    @breadcrumb = @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    redirect_to root_path, method: :get, notice: 'Ooops! Category not found :('
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end
