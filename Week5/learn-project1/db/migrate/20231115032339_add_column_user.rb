# frozen_string_literal: true

class AddColumnUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :active, :boolean
    add_column :users, :age,    :integer
  end
end
