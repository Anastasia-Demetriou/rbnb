class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index, :show

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[id])
  end

  def new
    @user =
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
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

end
