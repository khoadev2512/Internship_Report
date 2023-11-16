# frozen_string_literal: true

class AddReferenceProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :users, foreign_key: true
  end
end
