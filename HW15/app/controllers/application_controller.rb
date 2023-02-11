# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :categories_all, :current_order, :order_products_quantity

  def categories_all
    @categories = Category.all
  end

  def current_order
    Order.find(cookies[:order_id])
  rescue ActiveRecord::RecordNotFound
    if current_user
      @user_id = current_user.id
      order = Order.create(user_id: @user_id)
      cookies[:order_id] = order.id
      order
    else
      redirect_to new_user_session_path
    end
  end

  def order_products_quantity
    current_order.line_items.sum(&:quantity)
  end
end
