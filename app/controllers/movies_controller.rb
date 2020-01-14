class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:send_info]

  def index
    @movies = Movie.all.limit(7)
    @movies = Movie.paginate(page: params[:page], per_page: 7)

  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new(movie_id: @movie.id)
  end

  def send_info
    movie = Movie.find(params[:id])
    MovieInfoMailerJob.perform_async(current_user, movie)
    redirect_back(fallback_location: root_path, notice: "Email sent with movie info")
  end

  def export
    MovieExporterJob.perform_async(current_user)
    redirect_to root_path, notice: "Movies exported"
  end
end
