# frozen_string_literal: true

module LineItemable
  extend ActiveSupport::Concern

  def line_item_total_price
    product.price * quantity
  end
end
