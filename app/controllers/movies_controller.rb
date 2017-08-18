class MoviesController < ApplicationController
  before_action  :set_movie, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!, except: [:show, :index]


  def  search
    if  params[:search].present?
      @movies  =  Movie.search(params[:search]).find(params[:id])
    else
      @movies  =  Movie.all
    end
  end

   #  收藏电影
  def  join
    @movie  =  Movie.find(params[:id])
    if  !current_user.is_member_of?(@movie)
      current_user.join_collection!(@movie)
      flash[:notice]  =  "成功收藏电影, #{@movie.title}!"
    else
      flash[:warning]  =  "已经收藏了！"
    end

    redirect_to  movie_path(@movie)
  end

  #  取消收藏电影
  def  quit
    @movie  =  Movie.find(params[:id])
    if current_user.is_member_of?(@movie)
      current_user.quit_collection!(@movie)
      flash[:notice]  =  "已取消收藏!"
    else
      flash[:warning]  =  "未收藏!"
    end

    redirect_to  movie_path(@movie)
  end

  def   index
    @movies  =  Movie.where(:is_hidden => false).rank(:row_order)
  end

  def  new
    @movie  =  Movie.new
  end

  def  create
    @movie  =  Movie.new(movie_params)

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
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image, :is_hidden)
  end

end
