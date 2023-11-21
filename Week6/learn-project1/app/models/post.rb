# frozen_string_literal: true

class Post < ActiveRecord::Base
  serialize :tags
end
