# frozen_string_literal: true

class Book < ApplicationRecord
  # belongs_to :user
  # validates_associated :user

  # after_save_commit :log_product_saved_to_db

  # private

  # def log_product_saved_to_db
  #   Rails.logger.debug 'Product was saved to database'
  # end
  belongs_to :author
  belongs_to :supplier
  has_many :reviews
  has_and_belongs_to_many :orders

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }
  scope :old, -> { where(year_published: ...50.years.ago.year) }
  scope :out_of_print_and_expensive, -> { out_of_print.where('price > 500') }
  scope :costs_more_than, ->(amount) { where('price > ?', amount) }
end
