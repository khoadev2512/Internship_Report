class Book < ApplicationRecord
  belongs_to :user
  validates_associated :user
end
