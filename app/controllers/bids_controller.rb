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
    @bid = Bid.new()
    authorize @bid
  end

  def create
    @bid = Bid.new(bid_params)
    authorize @bid
    if @bid.save
      flash[:success] = "Bid saved!"
      redirect_to event_path(@event.user)
    else
      render :new
    end
  end

  private

  def set_bid
    @bid = Bid.find(params[:bid_id])

  end

  def bid_params
     params.require(:bid).permit(:user_id, :event_id, :price, :description)
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
