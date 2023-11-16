# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  validates_associated :user

  after_save_commit :log_product_saved_to_db

  private

  def log_product_saved_to_db
    Rails.logger.debug 'Product was saved to database'
  end
end
