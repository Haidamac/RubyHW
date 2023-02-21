class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order

  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
  end

  def total_price
    line_items.sum(&:line_item_total_price)
  end
end
