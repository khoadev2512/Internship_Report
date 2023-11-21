class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.integer :state
      t.integer :customer_id
      t.integer :book_id

      t.timestamps
    end
  end
end
