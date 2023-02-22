# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :categories_all, :current_order, :order_products_quantity

  def categories_all
    @categories = Category.all
  end

  def current_order
    if current_user.orders.unpaid.first.present?
      current_user.orders.unpaid.first
    else
      current_user.orders.create(status: 1)
    end
  end

  def order_products_quantity
    current_order.line_items.sum(&:quantity)
  end
end
