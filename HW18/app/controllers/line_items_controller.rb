# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[show update update_order destroy]
  before_action :change_quantity, only: %i[update update_order]

  def show; end

  def create
    current_user.orders.create if current_order.nil?

    @product = Product.find(params[:product_id])
    @line_item = current_order.line_items.find_by(product: @product)
    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_order.line_items.includes(:product).create(product: @product, quantity: 1, price: @product.price)
    end

    respond_to do |format|
      format.html { redirect_to line_item_path(id: @line_item.id) }
      format.turbo_stream
    end
  end

  def update
    respond_to do |format|
      format.html { redirect_to line_item_path(id: @line_item.id) }
      format.turbo_stream
    end
  end

  def update_order
    redirect_back(fallback_location: current_order)
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_order)
  end

  private

  def set_line_item
    @line_item = LineItem.includes(:product).find(params[:id])
  end

  def change_quantity
    @product = @line_item.product
    if params[:change_quantity] == 'add'
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item.quantity > 1 ? @line_item.update(quantity: @line_item.quantity - 1) : @line_item.destroy
    end
  end
end
