class CreateBookOrders < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :orders
  end
end
