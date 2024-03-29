class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy add_quantity reduce_quantity]

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    flash[:notice] = "#{product.name} was successfully added to the cart"
    redirect_to cart_path
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end

  def add_quantity
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end

  def reduce_quantity
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    elsif @line_item.quantity == 1
      destroy
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
