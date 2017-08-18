class Admin::MoviesController < ApplicationController
  before_action  :set_movie, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!, except: [:show, :index]


  def  reorder
    @movie  =  Movie.find(params[:id])
    @movie.row_order_position  =  params[:position]
    @movie.save!

    respond_to  do  |format|
      format.html  {  redirect_to  admin_movies_path}
      format.json  {  render  :json  =>  {  :message  =>  "ok" } }
    end

  end

  def  bulk_update
    total  =  0
    Array(params[:ids]).each  do  |movie_id|
      movie  =  Movie.find(movie_id)
      if   params[:commit]  ==  I18n.t(:bulk_update)
        movie.status  =  params[:movie_status]
        if  movie.save
          total  +=  1
        end
      elsif  params[:commit]  ==  I18n.t(:bulk_delete)
        movie.destroy
        total  +=  1
      end
    end

    flash[:alert]  =  "成功完成 #{total} 笔"
    redirect_to  admin_movies_path
  end


  def   index
    @movies  =  Movie.all.rank(:row_order)
  end

  def  new
    @movie  =  Movie.new
    @movie.tickets.build
  end

  def  create
    @movie  =  Movie.new(movie_params)
    @movie.user  =  current_user

    if  @movie.save
      redirect_to  admin_movies_path
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
      @avg_review  =    @reviews.average(:rating).present? ? @reviews.average(:rating).round(2)  : 0
    end
  end

  def  edit
    @movie.tickets.build  if   @movie.tickets.empty?
  end

  def  update
    if  @movie.update(movie_params)
      redirect_to  admin_movies_path
    else
      render  :edit
    end
  end

  def  destroy
    @movie.destroy
    redirect_to  admin_movies_path
  end

  private

  def  set_movie
    @movie  =  Movie.find(params[:id])
  end

  def  movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image, :is_hidden,
    :tickets_attributes  =>  [:id,  :name,  :description,  :price, :_destroy] )
  end
end
