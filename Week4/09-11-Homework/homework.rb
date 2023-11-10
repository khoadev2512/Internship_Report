# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Read Information
class RetrieveInformation
  def self.all_titles(url)
    doc = Nokogiri::HTML(URI.open(url))
    result = []
    doc.xpath('//article//h2//a').each do |link|
      news = {}
      link.each do |i|
        if i[0] == 'title'
          news['title'] = i[1]
          result << news
        end
        news['url'] = i[1] if i[0] == 'href'
      end
    end
    des = []
    doc.xpath('//article//p//a').each do |link|
      des << link.content.gsub!("\n", '')
    end
    result.zip(des).map do |i|
      i[0]['description'] = i[1]
      i[0]
    end
    result
  end
end

p RetrieveInformation.all_titles('https://vnexpress.net/so-hoa/cong-nghe/ai')
