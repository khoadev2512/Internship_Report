# frozen_string_literal: true

class ChangeTableUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.remove_column :age, :integer
      t.string  :adrress
      t.index   :name
      t.rename  :sex, :generation
    end
  end
end
