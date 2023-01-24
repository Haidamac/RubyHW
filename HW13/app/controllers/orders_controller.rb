# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show pay_details pay paid]

  def index
    current_user.orders.includes(:line_items).each do |order|
      order.destroy if order.total_price.zero?
    end
    @orders = current_user.orders.not_empty
  end

  def show
    @line_items = @order.line_items.includes(:product)
    if @order.unpaid? && (Time.now > @order.created_at + 1.day)
      @order.canceled!

      redirect_to order_paid_path, notice: 'Your order is canceled, because it was created too long ago and unfinished'
    elsif @order.paid?

      redirect_to order_paid_path
    end
  end

  def show_current
    @order = current_order
    @line_items = current_order.line_items.includes(:product)
  end

  def pay_details
    @order_id = @order.id if current_user
    cookies.delete(:order_id)
  end

  def pay
    @order.paid!
    user = current_user
    order = @order
    @user_email = current_user.email
    @order_id = @order.id
    UserMailer.new_order(user, order).deliver_now
    redirect_to order_paid_path, method: :get,
                                 notice: 'Thanks So Much for Your Order! I Hope You Enjoy Your New Purchase!'
  end

  def paid; end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    cookies.delete(:order_id)
    redirect_to current_order_path, method: :get, notice: 'Ooops! Something wrong. Please try again'
  end
end
