class MoviesController < ApplicationController
  before_action  :set_movie, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!, except: [:show, :index]
  before_action  :require_is_admin

  def  search
    if  params[:search].present?
      @movies  =  Movie.search(params[:search])
    else
      @movies  =  Movie.all
    end
  end

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
    unless  @reviews.present?
      @avg_review  =  0
      @reviews.length  ==  0
    else
      @avg_review  =  @reviews.average(:rating).present? ?  @reviews.average(:rating).round(2)  : 0
    end

    set_page_title  @movie.title
    # set_page_description  "#{@movie.description}"   一般情况下使用
    page_description  =  view_context.truncate(@movie.description, length: 100)  # description过长时使用
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
