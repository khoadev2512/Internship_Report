# frozen_string_literal: true

# class
class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }, dependent: :restrict_with_exception, inverse_of: :author
  accepts_nested_attributes_for :books
end
