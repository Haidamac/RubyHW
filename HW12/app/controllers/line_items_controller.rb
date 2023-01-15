class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[update destroy]

  def create
    product = Product.find(params[:product_id])
    @line_item = current_order.line_items.find_by(product: product)

    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_order.add_product(product)
    end

    redirect_to current_order_path, notice: "#{product.name} was successfully added to the cart"
  end

  def update
    if params[:change_quantity] == 'add'
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item.quantity > 1 ? @line_item.update(quantity: @line_item.quantity - 1) : @line_item.destroy
    end

    redirect_back(fallback_location: current_order)
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_order)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'line_item id not found' }, status: :not_found
  end
end
