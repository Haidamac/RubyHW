# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  image       :string
#  name        :string
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify
end
