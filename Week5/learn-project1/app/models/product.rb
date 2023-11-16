# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :pictures, as: :imageable, dependent: :restrict_with_exception

  # belongs_to :user
  validates :name, presence: { strict: true }
  validates :name, uniqueness: true

  before_create do
    self.description = name if description.blank?
  end
end
