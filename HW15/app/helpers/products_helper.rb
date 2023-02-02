# frozen_string_literal: true

module ProductsHelper
  def add_cart(product)
    return unless current_user

    if !current_order.line_items.where(product_id: product.id).present?
      # Add to Cart
      button_to 'Add to cart', line_items_path(product_id: product.id), class: 'btn btn-light btn-sm'
    else
      # if product is in cart - checkout
      button_to 'Checkout', current_order_path, method: :get, class: 'btn btn-light btn-sm'
    end
  end

  def add_cart_product(_product)
    return unless current_user

    if !current_order.line_items.where(product_id: @product.id).present?
      button_to 'Add to cart', line_items_path(product_id: @product.id), class: 'btn btn-outline-primary'
    else
      button_to 'Checkout', current_order_path, method: :get, class: 'btn btn-outline-primary'
    end
  end
end
