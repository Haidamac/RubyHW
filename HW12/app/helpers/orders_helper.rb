module OrdersHelper

  def order_status_view(order)
    if order.paid?
      "Date of purchase #{order.updated_at.to_date}"
    else
      link_to "Order date #{order.created_at.to_date} Please, repeat your order!", root_path
    end
  end
end
