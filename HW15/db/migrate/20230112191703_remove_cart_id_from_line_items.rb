# frozen_string_literal: true

class RemoveCartIdFromLineItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :line_items, :cart_id, :bigint
  end
end
