# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status     :integer          default("unpaid")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :nullify
  enum status: { unpaid: 0, paid: 1, canceled: 2 }

  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
  end

  def total_price
    sum = 0
    line_items.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    sum
  end
end
