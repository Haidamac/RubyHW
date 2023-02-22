# frozen_string_literal: true

module OrdersHelper
  def order_date(order)
    if order.paid?
      "Date of purchase #{order.updated_at.to_date}"
    else
      "Order date #{order.created_at.to_date}"
    end
  end

  def order_status_view(order)
    if order.paid?
      "Date of purchase #{order.updated_at.to_date}"
    else
      link_to "Order date #{order.created_at.to_date} Please, repeat your order!", root_path
    end
  end

  def order_status_button(order)
    if order.paid?
      link_to 'paid', order_paid_path(order), class: 'btn btn-outline-success btn-sm'
    else
      link_to 'unpaid', order_path(order), class: 'btn btn-outline-danger btn-sm'
    end
  end
end
