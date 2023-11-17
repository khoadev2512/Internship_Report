# frozen_string_literal: true

class User < ApplicationRecord
  # has_one :product, dependent: :destroy
  has_many :books, dependent: :restrict_with_exception
  has_many :pictures, as: :imageable, dependent: :restrict_with_exception

  # validates_associated :product

  validates :age, confirmation: true
  validates :fullname, confirmation: { case_sensitive: true }
  validates :age, comparison: { greater_than: 0 }
  validates :age, comparison: { other_than: 13 }
  validates :generation, inclusion: { in: %w[male female], meassage: '%<value>s is not a valid size' }, allow_nil: true
  validates :fullname, length: { minimum: 5 }
  validates :fullname, length: { maximum: 30, too_long: '30 characters is the maximum allowed' }
  validates :age, numericality: { only_integer: true }, on: create
  validates :fullname, presence: true

  validates_each :fullname do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if /\A[[:lower:]]/.match?(value)
  end
  # validates :generation, presence: true, if: :adult
  # def adult
  #   age > 18
  # end
  # validates :generation, presence: true, if: proc { |i| i.age > 18 }

  after_initialize do |user|
    puts "You have initialized an user #{user.fullname}"
  end

  after_find do |user|
    puts "You have found the user #{user.fullname}"
  end
end
