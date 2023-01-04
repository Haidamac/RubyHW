class ApplicationController < ActionController::Base

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end

  def cart_products_quantity
    current_cart.line_items.map(&:quantity).sum
  end

  helper_method :current_cart
end
