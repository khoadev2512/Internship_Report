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
    response = @@connection.put do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = data
      request.url @id
    end

    response.success?
  end

  def delete
    response = @@connection.delete do |request|
      request.headers['Content-Type'] = 'application/json'
      request.url @id
    end

    response.success?
  end

  # Generate doc funciton (homework)
  def self.generate_table_doc(data_list)
    my_html = '<html><head></head><body><table border="1"><tr><th>Id</th><th>Active</th><th>Sex</th><th>Avatar</th>
    <th>Name</th><th>Created At</th></tr>'
    sort_list = data_list.map { |i| i.reverse_each.to_h }
    sort_list.each do |item|
      my_html += '<tr>'
      item.each do |_key, value|
        my_html += (value.nil? ? '<td></td>' : "<td>#{value}</td>")
      end
      my_html += '</tr>'
    end
    my_html += '</table></body></html>'
    Htmltoword::Document.create_and_save(my_html, '/home/khoanv/Internship_Report/data_table.docx')
  end

  private

  def data
    {}.tap do |attributes|
      attributes[:id] = @id unless @id.to_s.empty?
      attributes[:name] = @name unless @name.to_s.empty?
      attributes[:active] = @active unless @active.to_s.empty?
      attributes[:sex] = @sex unless @sex.to_s.empty?
      attributes[:avatar] = @avatar unless @avatar.to_s.empty?
      attributes[:created_at] = @created_at unless @created_at.to_s.empty?
    end.to_json
  end
end

User.generate_table_doc(User.all_users)
