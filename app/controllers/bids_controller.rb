class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @event = policy_scope(Bid).order(created_at: :desc)
  end

  def show
    @bid = set_bid
    authorize @bid
  end

  def new
    @event = Event.find(params[:event_id])
    @bid = Bid.new
    authorize @bid
  end

  def create
    @event = Event.find(params[:event_id])
    @bid = Bid.new(bid_params)
    @bid.event = @event
    @bid.user = current_user
    authorize @bid
    if @bid.save
      flash[:success] = "Bid saved!"
      redirect_to event_bid_path(@event, @bid)
    else
      render :new
    end
  end

  private

  def set_bid
    @bid = Bid.find(params[:id])

  end

  def bid_params
     params.require(:bid).permit(:price, :description)
  end

  def edit
    authorize @bid
  end

  def update
    authorize @bid
  end

  def destroy
    authorize @bid
  end
end
