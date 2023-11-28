# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true
      t.timestamps
    end
    add_index :pictures, %i[imageable_type imageable_id]
  end
end
