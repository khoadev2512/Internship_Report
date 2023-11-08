# frozen_string_literal: true

require 'json'
require 'faraday'
require 'csv'
# User
class User
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

  def self.delete(id)
    @@connection.delete do |request|
      request.headers['Content-Type'] = 'application/json'
      request.url id.to_s
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

  def self.import_csv(_data_list)
    csv_file = 'Week4/07-11-Homework/users.csv'
    data = []
    # Read the CSV file and populate the data array
    CSV.foreach(csv_file, headers: true) do |row|
      data << {
        'name' => row['name'],
        'avatar' => row['avatar'],
        'sex' => row['sex']
      }
    end
    list_users = User.all_users
    if list_users.count == 100
      delete_users = [list_users.last['id'].to_i]
      (1..4).each { |i| delete_users << (list_users.last['id'].to_i - i).to_s }
      delete_users.each { |id| User.delete(id) }
    end
    data.each do |user|
      @@connection.post do |request|
        request.headers['Content-Type'] = 'application/json'
        request.body = user.to_json
      end
    end
  end

  private

  def to_json(*_args)
    JSON.generate({ 'created_at' => @created_at, 'name' => @name, 'avatar' => @avatar, 'sex' => @sex,
                    'active' => @active, 'id' => @id })
  end
end

# User.generate_csv(User.all_users)
User.import_csv(User.all_users)
