class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }
  accepts_nested_attributes_for :books
end
