class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :line_items
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  def order_price
    sum = 0
    cart.line_item.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    sum
  end
end
