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
    html = URI.open(@url, "User-Agent" => "Mozilla/5.0")
    doc = Nokogiri::HTML(html)

    # Pegando os dados (com os seletores que você descobriu!)
    title_element = doc.at_css('h1.movie__title')
    return nil unless title_element

    {
      title: title_element.text.split('(').first&.strip,
      year: doc.at_css('.movie__year')&.text&.gsub(/[()]/, '')&.to_i,
      rating: doc.at_css('.rating-badge__value')&.text&.strip&.to_f,
      director: doc.at_css('a.movie__country-link')&.text&.strip,
      filmow_url: @url
    }
  rescue
    nil
  end
end
