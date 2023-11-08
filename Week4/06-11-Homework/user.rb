# frozen_string_literal: true

# User
class User
  require 'json'
  require 'faraday'
  require 'htmltoword'

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

  def self.delete_nil(list_users)
    list_users.each do |i|
      i.each { |_key, value| User.delete(i['id']) if value.nil? }
    end
  end

  # Generate doc funciton (homework)
  def self.generate_table_doc(data_list)
    my_html = '<html><head></head><body><table border="1"><tr><th>Id</th><th>Name</th><th>Sex</th><th>Avatar</th>
    <th>Active</th><th>Created At</th></tr>'
    field_order = %w[id name sex avatar active created_at]

    # Sort the data array by the specified fields
    sort_list = data_list.map do |item|
      sorted_item = field_order.map { |field| [field, item[field]] }
      sorted_item.to_h
    end
    sort_list.each do |item|
      my_html += '<tr>'
      item.each do |_key, value|
        my_html += (value.nil? ? '<td></td>' : "<td>#{value}</td>")
      end
      my_html += '</tr>'
    end
    my_html += '</table>'

    # Add the image outside the table
    my_html += '<img src="sex_percentage.png" style="width: 600px; height: 400px">'

    my_html += '</body></html>'
    Htmltoword::Document.create_and_save(my_html, '/home/khoanv/Internship_Report/data_table.docx')
  end

  private

  def to_json(*_args)
    JSON.generate({ 'created_at' => @created_at, 'name' => @name, 'avatar' => @avatar, 'sex' => @sex,
                    'active' => @active, 'id' => @id })
  end
end

# User.generate_table_doc(User.all_users)
# User.delete_nil(User.all_users)

# User.all_users
# result = {}
# list_users.map do |ele|
#   result[ele['sex']] ? result[ele['sex']]  += 1 : result[ele['sex']] = 1
# end
# p result

# update_user = User.new(id: '218', name: 'Ernest Paucek Sr123', active: false,
#                        avatar: 'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/928.jpg',
#                        sex: 'male', created_at: Time.now)
# update_user.update
