class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index, :show

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[id])
  end

  def new
    @event = Event.new(event_params)
  end

  def create
    @user = current_user
    @event = @event = Event.new(event_params)
    @event.user = current_user.event(params[:user_id])
    if @event.save
      redirect_to event_path(@event.user)
    else
      render :new
    end
  end

  def edit
    if current_user.id == @event.user.id
    @event = Event.find(event_params)
  end

  def update
    if @event.update(event_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    event.destroy
    redirect_to event_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :type, :location, :description, :party_size, :service, :price_range)
  end
end
