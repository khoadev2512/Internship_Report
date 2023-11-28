Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key = ENV['API_KEY']
  config.api_secret = ENV['API_SECRET']
  config.secure = true # Ensures HTTPS
  config.cdn_subdomain = true # Optional, use CDN subdomain for assets
end