# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  status     :integer          default("empty")
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
  include Orderable

  belongs_to :user
  has_many :line_items, dependent: :destroy

  enum :status, { empty: 0, unpaid: 1, paid: 2, canceled: 3 }

  def add_product(product)
    line_items.includes(:product).create(product:, quantity: 1, price: product.price)
  end


end
