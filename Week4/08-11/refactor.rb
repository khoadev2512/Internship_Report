# frozen_string_literal: true

require 'csv'
require 'caracal'
require_relative '../06-11-Homework/user'

# Import file
class Importer
  def self.import_csv(csv_file_path)
    CSV.foreach(csv_file_path, headers: true) do |row|
      user_data = row.to_h.transform_keys(&:to_sym)
      new_user = User.new(user_data)
      new_user.create
    end
  end
end

# Export doc
class DocExporter
  def self.export_doc(lists)
    doc = Caracal::Document.new('Week4/08-11/UserTable.docx')
    doc.p do
      text 'List users'
    end
    headers = %w[Id Name Sex Active Avatar Created_at]
    table_data = [headers] + lists.map { |item| headers.map { |header| item[header.downcase] } }
    doc.table table_data, border_size: 3 do
      cell_style cols[0], width: 100
      cell_style cols[1], width: 280
      cell_style cols[2], width: 130
      cell_style cols[3], width: 100
      cell_style cols[4], width: 500
      cell_style cols[5], width: 380
    end
    doc.save
  end
end

# Testing
# Importer.import_csv('Week4/07-11-Homework/users.csv')
DocExporter.export_doc(User.active_users)
