class RentalsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    # todo: add more codes
    flash[:warning] = "You checked out #{movie.title}. #{catch_phrase.sample}."
    redirect_to movies_path
  end

  private

  def catch_phrase
    ["Radical", "Gnarly", "Choice", "Fresh", "Awesome", "Bodacious"]
  end
end
