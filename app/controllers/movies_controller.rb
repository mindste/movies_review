class MoviesController < ApplicationController
  before_action  :set_movie, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!, except: [:show, :index]
  before_action  :require_is_admin

  def   index
    @movies  =  Movie.all.recent
  end

  def  new
    @movie  =  Movie.new
  end

  def  create
    @movie  =  Movie.new(movie_params)
    @movie.user  =  current_user

    if  @movie.save
      redirect_to  @movie
    else
      render  :new
    end

  end

  def  show
    @reviews  =   @movie.reviews.recent
    if  @reviews.blank?
      @avg_review  =  0
    else
      @avg_review  =   @reviews.average(:rating).round(2)
    end
  end

  def  edit
  end

  def  update
    if  @movie.update(movie_params)
      redirect_to  @movie
    else
      render  :edit
    end
  end

  def  destroy
    @movie.destroy
    redirect_to  movies_path
  end

  private

  def  set_movie
    @movie  =  Movie.find(params[:id])
  end

  def  movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image)
  end

end
