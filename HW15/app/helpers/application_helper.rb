# frozen_string_literal: true

module ApplicationHelper
  def categories_all
    @categories = Category.all
  end

  def order_products_quantity
    current_order.line_items.sum(&:quantity)
  end

  def quantity_in_cart
    return if order_products_quantity.zero?

    order_products_quantity
  end
end
