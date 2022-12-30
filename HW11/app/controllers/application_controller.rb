class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end

  helper_method :current_cart
end
