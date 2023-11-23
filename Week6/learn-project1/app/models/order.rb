# frozen_string_literal: true

class Order < ApplicationRecord
  has_and_belongs_to_many :books, join_table: 'books_orders'
  belongs_to :customer

  # enum :status, %i[shippedd being_packed complete cancelled]
  scope :created_before, ->(time) { where(created_at: ...time) }
  scope :lmao, ->(abc) { where(subtotal: ..abc) }
end
