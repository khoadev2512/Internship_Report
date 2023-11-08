# frozen_string_literal: true

# User
class User
  require 'json'
  require 'faraday'

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

  def self.active_users
    response = @@connection.get do |request|
      request.params['active'] = true
    end

    return JSON.parse(response.body) if response.success?

    []
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
      request.url id
    end
  end

  def create
    # Remove the last user if the user > 100
    list_users = User.all_users
    @@connection.delete("/api/v1/users/#{list_users.last['id'].to_i}") if list_users.count == 100

    # Add new user
    response = @@connection.post do |req|
      req.url '/api/v1/users'
      req.headers['Content-Type'] = 'application/json'
      req.body = to_json
    end
    response.success?
  end

  private

  def to_json(*_args)
    JSON.generate({ 'created_at' => @created_at, 'name' => @name, 'avatar' => @avatar, 'sex' => @sex,
                    'active' => @active, 'id' => @id })
  end
end

# Testing
update_user = User.new(id: '218', name: 'Ernest Paucek Sr123', active: false,
                       avatar: 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/928.jpg',
                       sex: 'male', created_at: Time.now)
update_user.update
