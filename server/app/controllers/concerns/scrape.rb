require 'nokogiri'
require 'open-uri'

module Scrape
  extend ActiveSupport::Concern

  # ページのurlのタイトルを抽出する処理を行う
  def page_title_scrape(url)
    charset = nil
    html = URI.open(url) do |page|
      charset = page.charset
      page.read
    end
    contents = Nokogiri::HTML.parse(html, nil, charset)

    return contents.title
  end

  module_function :page_title_scrape
end

