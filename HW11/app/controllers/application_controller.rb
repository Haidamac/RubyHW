class ApplicationController < ActionController::Base
  helper_method :current_cart, :cart_products_quantity

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end

  def cart_products_quantity
    current_cart.line_item.map(&:quantity).sum
  end
end
