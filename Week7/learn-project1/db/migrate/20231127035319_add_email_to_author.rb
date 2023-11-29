# frozen_string_literal: true

class AddEmailToAuthor < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :email, :text
  end
end
