# frozen_string_literal: true

# Draw chart for class User
class Graph
  require 'gruff'
  require 'caracal'
  def self.draw_pie(lists, attr)
    g = Gruff::Pie.new
    g.title = "#{attr.capitalize} percentage of all users"
    result = {}
    lists.map do |ele|
      result[ele[attr]].nil? ? result[ele[attr]] = 1 : result[ele[attr]] += 1
    end
    result.each { |key, value| g.data(key, value) }
    g.write("Week4/07-11/#{attr.capitalize}_percentage.png")
    current_directory = Dir.pwd
    current_directory += '/Week4/07-11'
    image_filename = "#{attr.capitalize}_percentage.png"

    image_path = File.join(current_directory, image_filename)

    Caracal::Document.save 'Week4/07-11/example.docx' do |docx|
      docx.img image_path do
        width   250
        height  200
        align   :left
      end
    end
  end
end

# Testing
require_relative '../06-11-Homework/user'
Graph.draw_pie(User.all_users, 'sex')
Graph.draw_pie(User.all_users, 'active')
