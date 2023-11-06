# frozen_string_literal: true

require 'faraday'
require 'json'

conn = Faraday.new(url: 'https://6418014ee038c43f38c45529.mockapi.io') do |faraday|
  faraday.request  :url_encoded
  faraday.response :logger
  faraday.adapter  Faraday.default_adapter
end

def get_users(conn)
  JSON.parse(conn.get('/api/v1/users').body)
end

def get_users_by_active(conn, act)
  JSON.parse(conn.get('/api/v1/users', { active: act }).body)
end

def add_user(conn, user)
  existing_data = get_users(conn)
  # Remove the last element if the array size exceeds the maximum
  conn.delete("/api/v1/users/#{existing_data.last['id'].to_i}") if existing_data.count == 100

  # Send the updated JSON array in the request body
  conn.post do |req|
    req.url '/api/v1/users'
    req.headers['Content-Type'] = 'application/json'
    req.body = user
  end
end

p users = get_users(conn)
p get_users_by_active(true)

data = {
  'created_at' => Time.now.to_s,
  'name' => 'Nguyen Van Khoa',
  'avatar' => 'https://duhocvietglobal.com/wp-content/uploads/2018/12/dat-nuoc-va-con-nguoi-anh-quoc.jpg',
  'sex' => 'male',
  'active' => true,
  'id' => users.last['id']
}
json_data = JSON.generate(data)
p add_user(conn, json_data)
