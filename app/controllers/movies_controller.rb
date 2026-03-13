class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
    @movie = Movie.new # Para o formulário de importação
  end

  def create
    url = params[:movie][:filmow_url]
    dados = FilmowScraperService.call(url)

    if dados
      @movie = Movie.find_or_create_by(filmow_url: url) do |m|
        m.title = dados[:title]
        m.director = dados[:director]
        m.year = dados[:year]
        m.rating = dados[:rating]
      end
      redirect_to root_path, notice: "Filme importado com sucesso!"
    else
      redirect_to root_path, alert: "Não conseguimos importar esse filme."
    end
  end
end
