# frozen_string_literal: true

class AddColumnUser < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.boolean :active
      t.integer :age
    end
  end
end
