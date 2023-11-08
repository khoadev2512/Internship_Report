# frozen_string_literal: true

# User
class User
  require 'json'
  require 'faraday'
  require 'csv'

  API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'
  @@connection = Faraday.new(url: API_URL)
  attr_accessor :id, :name, :sex, :active, :avatar, :created_at

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @sex = attributes[:sex]
    @active = attributes[:active]
    @avatar = attributes[:avatar]
    @created_at = attributes[:created_at]
  end

  def self.all_users
    response = @@connection.get

    return JSON.parse(response.body) if response.success?

    []
  end

  def create
    response = @@connection.post do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = data
    end

    response.success?
  end

  def update
    p to_json
    response = @@connection.put do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = to_json
      request.url @id
    end

    response.success?
  end

  def delete
    @@connection.delete do |request|
      request.headers['Content-Type'] = 'application/json'
      request.url @id
    end
  end

  def self.generate_csv(data_list)
    csv_file = 'Week4/07-11-Homework/data.csv'

    # Open the CSV file for writing
    CSV.open(csv_file, 'w') do |csv|
      # Write the header row
      csv << %w[id name sex avatar active created_at]

      # Write the data rows
      data_list.each do |row|
        csv << [row['id'], row['name'], row['sex'], row['avatar'], row['active'], row['created_at']]
      end
    end
  end

  private

  def to_json(*_args)
    JSON.generate({ 'created_at' => @created_at, 'name' => @name, 'avatar' => @avatar, 'sex' => @sex,
                    'active' => @active, 'id' => @id })
  end
end

User.generate_csv(User.all_users)
