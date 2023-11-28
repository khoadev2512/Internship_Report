# frozen_string_literal: true

class CreateSomethings < ActiveRecord::Migration[7.1]
  def change
    create_table :somethings do |t|
      t.string :title

      t.timestamps
    end
  end
end
