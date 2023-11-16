# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[7.1]
  def change
    reversible do |direction|
      change_table :products do |t|
        direction.up   { t.change :fullname, :string }
        direction.down { t.change :name, :integer }
      end
    end
    change_column_default :users, :generation, from: nil, to: 'male'
  end
end
