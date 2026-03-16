class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
    @movie = Movie.new
  end

  def create
    url = params[:movie][:filmow_url]
    dados = FilmowScraperService.call(url)

    @movie = Movie.find_or_initialize_by(filmow_url: url)

    if dados
      @movie.assign_attributes(
        title: dados[:title],
        director: dados[:director],
        year: dados[:year],
        rating: dados[:rating]
      )
      notice_msg = "Filme importado com sucesso!"
    else
      @movie.title ||= "Importado via link (Dados indisponíveis)"
      notice_msg = "Link salvo! O Filmow bloqueou a leitura automática, mas você pode editar os dados manualmente."
    end

    if @movie.save
      redirect_to root_path, notice: notice_msg
    else
      redirect_to root_path, alert: "Erro ao salvar o filme."
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, notice: "Filme removido com sucesso!", status: :see_other
  end
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to root_path, notice: "Filme atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :year, :rating, :filmow_url)
  end
end
