# frozen_string_literal: true

# class
class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }, dependent: :restrict_with_exception
  accepts_nested_attributes_for :books

  has_rich_text :content

  has_one_attached :picture

  def self.ransackable_associations(_auth_object = nil)
    ['books']  # Allow searching through the 'books' association
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title first_name last_name created_at updated_at]
  end
end
