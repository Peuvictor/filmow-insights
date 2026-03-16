require 'nokogiri'
require 'open-uri'

class FilmowScraperService
  def self.call(url)
    new(url).import
  end

  def initialize(url)
    @url = url
  end

 def import
  options = {
    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
    "Accept-Language" => "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7",
    "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
    "Referer" => "https://filmow.com/"
  }

  html_raw = URI.open(@url, options).read
  doc = Nokogiri::HTML(html_raw, nil, 'UTF-8')
  title_element = doc.at_css('h1.movie__title')
  return nil unless title_element

  {
    title: title_element.text.split('(').first&.strip,
    year: doc.at_css('.movie__year')&.text&.gsub(/[()]/, '')&.to_i,
    rating: doc.at_css('.rating-badge__value')&.text&.strip&.to_f,
    director: doc.at_css('a.movie__country-link')&.text&.strip,
    filmow_url: @url
  }
rescue => e
  puts "Erro no scraping: #{e.message}"
  nil
end
end
