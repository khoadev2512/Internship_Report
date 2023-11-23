# frozen_string_literal: true

class AddTagsToBook < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :tags, :text
  end
end
