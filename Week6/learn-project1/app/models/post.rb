# frozen_string_literal: true

# class Post < ActiveRecord::Base
#   serialize :tags, Hash, coder: JSON
# end

class Post < ApplicationRecord
  serialize :tags, coder: JSON
end
