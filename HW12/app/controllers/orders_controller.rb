class OrdersController < ApplicationController
  before_action :set_order, only: %i[show pay_details pay paid destroy]

  def index
    @orders = current_user.orders.where.not(status: 'empty') if current_user
  end

  def show
    if @order.unpaid? && (Time.now > @order.created_at + 1.day)
      @order.canceled!

      redirect_to order_paid_path, notice: 'Your order is canceled, because it was created too long ago and unfinished'
    end
  end

  def show_current
    @order = current_order
  end

  def pay_details
    @order_id = @order.id if current_user
    cookies.delete(:order_id)
  end

  def pay
    @order.paid!
    @user_email = current_user.email
    @order_id = @order.id
    UserMailer.welcome.deliver_now
    redirect_to order_paid_path, method: :get, notice: 'Thanks So Much for Your Order! I Hope You Enjoy Your New Purchase!'
  end

  def paid; end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    cookies.delete(:order_id)
    redirect_to current_order_path, method: :get, notice: 'Ooops! Please try again'
  end
end
