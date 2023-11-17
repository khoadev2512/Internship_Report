class Order < ApplicationRecord
  has_and_belongs_to_many :books, join_table: 'books_orders'
  belongs_to :customer

  enum :status, [:shipped, :being_packed, :complete, :cancelled]
  scope :created_before, ->(time) { where(created_at: ...time) }
end
