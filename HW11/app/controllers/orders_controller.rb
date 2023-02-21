class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show pay_details pay paid]

  def index
    @orders = current_user.orders.all if current_user
  end

  def create
    order = current_user.orders.create(cart: current_cart)
    cookies.delete(:cart_id)
    flash[:notice] = 'Order was successfully created'
    redirect_to order_path(order)
  end

  def show; end

  def pay_details
    @order_id = @order.id if current_user
  end

  def pay
    @order.update(status: :paid)
    @user_email = current_user.email
    @order_id = @order.id
    user = current_user
    order = @order
    UserMailer.new_order(user, order).deliver_now
    flash[:notice] = 'Thanks So Much for Your Order! I Hope You Enjoy Your New Purchase!'
    redirect_to order_paid_path, method: :get
  end

  def paid; end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end
end
