# frozen_string_literal: true

# migrate
class AddColumnBooks < ActiveRecord::Migration[7.1]
  def change
    change_table :books, bulk: true do |t|
      t.rename :name, :title
      t.rename :user_id, :author_id
      t.integer :year_published
      t.string :isbn
      t.decimal :price
      t.boolean :out_of_print
      t.integer :views
      t.integer :supplier_id
    end
  end
end
