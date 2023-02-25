# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @products = @category.products.with_attached_image
    @breadcrumb = @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description, :price, :image)
  end
end
