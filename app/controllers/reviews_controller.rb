class ReviewsController < ApplicationController
  before_action  :set_review, only: [:edit, :update, :destroy]
  before_action  :set_movie
  before_action  :authenticate_user!

  def  new
    @review  =  Review.new
  end

  def  create
    @review   =  Review.new(review_params)
    @review.movie  =  @movie
    @review.user   =  current_user
    if  @review.save
      redirect_to  movie_path(@movie)
    else
      render  :new
    end
  end

  def  edit
  end

  def  update
    if  @review.update(review_params)
      redirect_to   @movie
    else
      render  :edit
    end
  end

  def  destroy
    @review.destroy
    redirect_to  @movie
  end

  private
  def  set_movie
    @movie  =  Movie.find(params[:movie_id])
  end

  def  set_review
    @review  =   Review.find(params[:id])
  end

  def   review_params
    params.require(:review).permit(:content)
  end


end
