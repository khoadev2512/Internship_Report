# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: { strict: true }
  validates :name, uniqueness: true
end
