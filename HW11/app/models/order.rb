class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :line_items
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  def total_cart_price
    cart.line_items.sum('price * quantity')
  end
end
