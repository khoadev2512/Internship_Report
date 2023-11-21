# frozen_string_literal: true

class AddUniqueProducts < ActiveRecord::Migration[7.1]
  def change
    add_index :products, :name, unique: true
  end
end
