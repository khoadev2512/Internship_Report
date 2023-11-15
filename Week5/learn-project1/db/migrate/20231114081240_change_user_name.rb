# frozen_string_literal: true

class ChangeUserName < ActiveRecord::Migration[7.1]
  def change
    reversible do |direction|
      direction.up do
        rename_column :users, :name, :fullname
      end
      direction.down do
        rename_column :users, :fullname, :name
      end
    end
  end
end
