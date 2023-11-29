# frozen_string_literal: true

# class
class Book < ApplicationRecord
  after_save :log_product_saved_to_db

  belongs_to :author
  belongs_to :supplier
  has_many :reviews, dependent: :restrict_with_exception
  has_and_belongs_to_many :orders

  has_one_attached :avatar
  has_rich_text :content

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }
  scope :old, -> { where(year_published: ...50.years.ago.year) }
  scope :out_of_print_and_expensive, -> { out_of_print.where('price > 500') }
  scope :costs_more_than, ->(amount) { where('price > ?', amount) }

  validates :title, length: { minimum: 3 }
  validates :title, :out_of_print, :views, :price, :year_published, presence: true

  # validates :views, numericality: { greater_than_or_equal_to: 0 }
  def self.ransackable_attributes(_auth_object = nil)
    %w[title created_at updated_at]
  end

  private

  def log_product_saved_to_db
    Rails.logger.debug 'Product was saved to database'
  end
end
