class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string  :name
      t.integer :has_bought

      t.timestamps
    end
  end
end
