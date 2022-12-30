class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify

  def add_product(product)
    LineItem.create(product: product, quantity: 1)
  end
end
