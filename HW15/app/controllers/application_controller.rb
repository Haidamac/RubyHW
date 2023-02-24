# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_order

  def current_order
    if current_user.orders.unpaid.first.present?
      current_user.orders.unpaid.first
    else
      current_user.orders.create
    end
  end
end
