# frozen_string_literal: true

class DropCartsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :carts do |t|
      t.timestamps null: false
    end
  end
end
