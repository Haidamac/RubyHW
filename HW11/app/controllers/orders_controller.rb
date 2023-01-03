class OrdersController < ApplicationController
  before_action :set_order, only: %i[show pay paid]

  def index
    @orders = current_user.orders.all
  end

  def create
    order = current_user.orders.create(cart: current_cart)
    # cookies.delete(:cart_id)
    redirect_to order_path(order), notice: 'Order was successfully created'
  end

  def show; end

  def pay
    @order.update(status: :paid)
    redirect_to order_paid_path, method: :get, notice: 'Thanks So Much for Your Order! I Hope You Enjoy Your New Purchase!'
  end

  def paid
    cookies.delete(:cart_id)
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'order id not found' }, status: :not_found
  end
end
