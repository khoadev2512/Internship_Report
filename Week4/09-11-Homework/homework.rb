# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Read Information
class RetrieveInformation
  def self.all_titles(url)
    doc = Nokogiri::HTML(URI.open(url))
    articles = doc.css('article')
    result = []

    articles.each do |article|
      news = {}
      title_link = article.at_css('h2 a')
      description_link = article.at_css('p a')

      news['title'] = title_link['title'] if title_link
      news['url'] = title_link['href'] if title_link
      news['description'] = description_link.content.gsub("\n", '') if description_link

      result << news unless news.empty?
    end
    result
  end
end

p RetrieveInformation.all_titles('https://vnexpress.net/so-hoa/cong-nghe/ai')
