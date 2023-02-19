class OrdersController < ApplicationController
  before_action :set_order, only: %i[show pay_details pay paid]

  def index
    @orders = current_user.orders.all if current_user
  end

  def create
    order = current_user.orders.create(cart: current_cart)
    cookies.delete(:cart_id)
    redirect_to order_path(order), notice: 'Order was successfully created'
  end

  def show
    if (Time.now > @order.created_at + 1.day) & @order.status == 'unpaid'
      @order.update(status: :canceled)

      redirect_to order_paid_path, notice: 'Your order is canceled, because it was created too long ago and unfinished'
    end
  end

  def pay_details
    @order_id = @order.id if current_user
  end

  def pay
    @order.update(status: :paid)
    @user_email = current_user.email
    @order_id = @order.id
    UserMailer.welcome.deliver_now
    redirect_to order_paid_path, method: :get, notice: 'Thanks So Much for Your Order! I Hope You Enjoy Your New Purchase!'
  end

  def paid
    # cookies.delete(:cart_id)
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  end
end
