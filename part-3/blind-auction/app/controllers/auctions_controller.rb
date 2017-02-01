class AuctionsController < ActionController
  def index
    @auctions.all
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
  end

  def destroy
  end



end
