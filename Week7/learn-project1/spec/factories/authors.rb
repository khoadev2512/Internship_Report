# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    title      { Faker::Job.title }
    email      { Faker::Internet.email}
  end
end
