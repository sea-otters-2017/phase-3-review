class AuctionsController < ApplicationController
  def index
    @auction = Auction.all
    render :index
  end
  def new
    @auction = Auction.new
    render :new
  end
  def show
    @auctions.find(params[:id])
    render :show
  end

  def create
    @auction = Auction.new(params)
     if @user.save!
        render :index
      else
        render :new
      end
  end

  def destroy
  end



end
