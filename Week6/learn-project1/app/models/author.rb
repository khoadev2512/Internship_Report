# frozen_string_literal: true

# class
class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }, dependent: :restrict_with_exception
  accepts_nested_attributes_for :books, reject_if: :all_blank

  has_rich_text :content

end
