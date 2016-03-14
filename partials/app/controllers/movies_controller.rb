class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title).limit(10)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
