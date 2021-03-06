class Admin::MovieBuyersController < ApplicationController


  before_action  :find_movie

  def  index
    @q  =  @movie.buyers.ransack(params[:q])

    @buyers  =  @q.result.includes(:ticket).order("id  DESC").page(params[:page])

    if   params[:buyer_id].present?
      @buyers  =  @buyers.where(  :id  =>  params[:buyer_id].split(",") )
    end

    if   params[:start_on].present?
      @buyers  =  @buyers.where( "created_at  >=  ?",  Date.parse(params[:start_on]).beginning_of_day  )
    end

    if   params[:end_on].present?
      @buyers   =  @buyers.where( "created_at  <=  ?",  Date.parse(params[:end_on]).end_of_day )
    end

    if  Array(params[:statuses]).any?
      @buyers  =  @buyers.by_status(params[:statuses])
    end

    if  Array(params[:ticket_ids]).any?
      @buyers  =  @buyers.by_ticket(params[:ticket_ids])
    end

    if  params[:status].present?  &&  Buyer::STATUS.include?(params[:status])
      @buyers  =  @buyers.by_status(params[:status])
    end

    if  params[:ticket_id].present?
      @buyers  =  @buyers.by_ticket(params[:ticket_id])
    end

  end

  def  show
    @buyer  =  @movie.buyers.find_by_uuid(params[:id])
  end

  def  new
  end

  def  create
    @buyer  =  @movie.buyers.new(buyer_params)
    @buyer.ticket  =  @movie.tickets.find( params[:buyer][:ticket_id] )
    @buyer.status  =  "confirmed"
    @buyer.user  =  current_user

    if  @buyer.save
      redirect_to  admin_movie_buyers_path(@movie)
    else
      render  "new"
    end
  end

  def  edit
    @buyer  =  @movie.buyers.find_by_uuid(params[:id])
  end

  def  update
    @buyer  =  @movie.buyers.update(buyer_params)
    @buyer.ticket  =  @movie.tickets.find(params[:buyer][:ticket_id])
    @buyer.status  =  "confirmed"
    @buyer.user  =  current_user

    if  @buyer.save
      redirect_to   admin_movie_buyers_path(@movie)
    else
      render "edit"
    end
  end

  def  destroy
    @buyer  =  @movie.buyers.find_by_uuid(params[:id])
    @buyer.destroy

    redirect_to  admin_movie_buyers_path(@movie)
  end



  protected

  def  find_movie
    @movie  =  Movie.find_by_friendly_id(params[:movie_id])
  end

  def   buyer_params
    params.require(:buyer).permit(:name, :email, :cellphone,  :ticket, :status, :bio)
  end

end
