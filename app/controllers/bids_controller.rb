class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @event = Event.find(params[:event])
    @bids = @event.bids
  end

  def show

  end

  def create
    bid.create(bid_params)
  end

  def new
    @bid = Bid.new()
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])

  end

  def bid_params
     params.require(:bid).permit(:user_id, :event_id, :price, :description)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
