# frozen_string_literal: true

module ProductsHelper
  def add_cart(product)
    turbo_frame_tag dom_id(product) do
      if current_order.line_items.where(product_id: product.id).present?
        render partial: 'products/in_cart', locals: { product: }
      else
        render partial: 'products/add_cart', locals: { product: }
      end
    end
  end
end
