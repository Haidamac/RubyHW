class ApplicationController < ActionController::Base
  helper_method :current_order, :order_products_quantity

  def current_order
    Order.find(cookies[:order_id])
  rescue ActiveRecord::RecordNotFound
    @user_id = current_user.id
    order = Order.create(user_id: @user_id)
    cookies[:order_id] = order.id
    order
  end

  def order_products_quantity
    current_order.line_items.map(&:quantity).sum
  end
end
