require 'googleauth'
require 'google_drive'
require 'dotenv'
require 'json'
require 'ggoogle/apis/drive_v3'

class GoogleDriveService
  def initialize
    @credentials = Google::Auth::UserRefreshCredentials.new(
      client_id: ENV['CLIENT_ID'],
      client_secret: ['CLIENT_SECRET'],
      scope: [
        'https://www.googleapis.com/auth/drive',
        'https://spreadsheets.google.com/feeds/'
      ],
      redirect_uri: 'https://developers.google.com/oauthplayground'
    )
    conn = Faraday.new(url: 'https://developers.google.com/oauthplayground/refreshAccessToken')
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { 'token_uri' => 'https://oauth2.googleapis.com/token',
                   'refresh_token' => ENV['REFRESH_TOKEN'] }.to_json
    end
    @credentials.code = ENV['AUTH_CODE']
    @credentials.access_token = JSON.parse(response.body)['access_token']
    @session = GoogleDrive::Session.from_credentials(@credentials)
  end

  def all_files_from_drive
    result = []
    @session.files.each do |file|
      result << file.title
    end
    result
  end

  def upload_file_drive(file_path, file_name)
    @session.upload_from_file(file_path, file_name, convert: false)
  end

  def download_file_drive(file_name)
    file = @session.file_by_title(file_name)
    File.write(File.join(__dir__, file_name), nil)
    file.download_to_file(File.join(__dir__, file_name))
  end

  def update_file_drive(file_update_path, file_name)
    file = @session.file_by_title(file_name)
    file.update_from_file(file_update_path)
  end

  def working_with_sheets(keys, sheet_num)
    ws = @session.spreadsheet_by_key(keys).worksheets[sheet_num]
    p ws[1, 1]
    ws[2, 1] = 'foo'
    ws[2, 2] = 'bar'
    ws.save
    ws.reload
  end
end
