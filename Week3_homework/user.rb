# frozen_string_literal: true

# User class
class User
  require 'json'
  require 'faraday'

  @@conn = Faraday.new(url: 'https://6418014ee038c43f38c45529.mockapi.io') do |faraday|
    faraday.request  :url_encoded
    faraday.response :logger
    faraday.adapter  Faraday.default_adapter
  end

  @@all_users = JSON.parse(@@conn.get('/api/v1/users').body)

  attr_accessor :created_at, :name, :avatar, :sex, :active, :id

  def initialize(name, avatar, sex)
    @created_at = Time.now.to_s
    @name = name
    @avatar = avatar
    @sex = sex
    @active = true
    @id = (@@all_users.last['id'].to_i == 100 ? 100 : @@all_users.last['id'].to_i + 1)
  end

  def self.all_users
    @@all_users
  end

  def self.get_users_by_active(act)
    JSON.parse(@@conn.get('/api/v1/users', { active: act }).body)
  end

  def self.add_user(user)
    # Remove the last user if the user > 100
    @@conn.delete("/api/v1/users/#{@@all_users.last['id'].to_i}") if @@all_users.count == 100

    # Add new user
    @@conn.post do |req|
      req.url '/api/v1/users'
      req.headers['Content-Type'] = 'application/json'
      req.body = user.to_json
    end
  end

  def to_json(*_args)
    JSON.generate({ 'created_at' => @name, 'name' => @age, 'avatar' => @avatar, 'sex' => @sex, 'active' => @active,
                    'id' => @id })
  end
end

# Testing
p User.all_users.last
p User.get_users_by_active(true)

new_user = User.new('Nguyen Van Khoa',
                    'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg', 'male')
User.add_user(new_user)
