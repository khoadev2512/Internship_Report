# frozen_string_literal: true

class ChangeDefalut < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :generation, from: nil, to: 'male'
  end
end
