# frozen_string_literal: true

module Orderable
  extend ActiveSupport::Concern

  def total_price
    line_items.includes(:product).sum(&:line_item_total_price)
  end
end
