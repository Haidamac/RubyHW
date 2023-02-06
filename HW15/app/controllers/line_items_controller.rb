# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[show update update_order destroy]

  def show; end

  def create
    product = Product.find(params[:product_id])
    @line_item = current_order.line_items.includes(:product).find_by(product:)

    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_order.add_product(product)
    end

    current_order.unpaid!
    redirect_to line_item_path(id: @line_item.id), notice: "#{product.name} was successfully added to the cart"
  end

  def update
    change_quantity

    redirect_to line_item_path(id: @line_item.id)
  end

  def update_order
    change_quantity

    redirect_back(fallback_location: current_order)
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_order)
  end

  private

  def set_line_item
    @line_item = LineItem.includes(:product).find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    redirect_to root_path, method: :get
  end

  def change_quantity
    if params[:change_quantity] == 'add'
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item.quantity > 1 ? @line_item.update(quantity: @line_item.quantity - 1) : @line_item.destroy
    end
  end
end
