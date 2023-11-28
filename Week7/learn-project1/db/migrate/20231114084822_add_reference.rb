# frozen_string_literal: true

class AddReference < ActiveRecord::Migration[7.1]
  def change
    # add_reference :users, :customers
    add_reference :users, :customers, foreign_key: true
    # remove_reference :users, :customers, foreign_key: true, index: false

    # add_foreign_key :users, :customers, column: :id, primary_key: :id
  end
end
