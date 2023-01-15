class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def show
    @breadcrumb = @product.category
    @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    redirect_to root_path, method: :get, notice: 'Ooops! Product not found :('
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
