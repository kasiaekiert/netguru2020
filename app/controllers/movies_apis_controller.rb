class MoviesApisController < ApplicationController
  def index
    @moviesapis = Movie.all
  end
end
