class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
