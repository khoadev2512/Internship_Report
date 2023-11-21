# frozen_string_literal: true

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  delegated_type :imageable, types: %w[User Product]
end
