class AddMoneyToBook < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :title, :text
  end
end
