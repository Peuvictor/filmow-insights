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
  html_raw = URI.open(@url, "User-Agent" => "Mozilla/5.0").read
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
