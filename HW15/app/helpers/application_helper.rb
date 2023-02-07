# frozen_string_literal: true

module ApplicationHelper

  def quantity_in_cart
    return if order_products_quantity.zero?

    order_products_quantity
  end
end
