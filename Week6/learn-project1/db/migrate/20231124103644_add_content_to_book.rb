# frozen_string_literal: true

class AddContentToBook < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :content, :text
  end
end
