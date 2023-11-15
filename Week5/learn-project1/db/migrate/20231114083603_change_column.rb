# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :fullname, false
    change_column_default :users, :generation, from: nil, to: 'male'
  end
end
