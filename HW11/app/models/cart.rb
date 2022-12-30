class Cart < ApplicationRecord
  has_many :line_item, dependent: :nullify
  has_one :order

  def add_product(product)
    line_item.create(product: product, quantity: 1)
  end

  def total_price
    line_item.map(&:product).sum(&:price)
  end
end
