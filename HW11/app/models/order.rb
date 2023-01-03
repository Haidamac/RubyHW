class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  has_many :line_items
  enum status: { unpaid: 0, paid: 1 }

end
