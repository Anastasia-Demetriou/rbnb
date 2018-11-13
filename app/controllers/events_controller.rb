class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bid, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Task saved!"
      redirect_to event_path(@event.user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.user_id == current_user.id
      @event.update(event_params)
      flash[:success] = "Task updated!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @event.user_id == current_user.id
      @event = Event.find(params[:id])
      event.destroy
      redirect_to event_path
    else
      render :destroy
    end
  end

  private

  def set_event
    @event = @user.event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:user_id, :name, :date, :type, :location, :description, :party_size, :service, :max_price, :min_price)
  end
end
