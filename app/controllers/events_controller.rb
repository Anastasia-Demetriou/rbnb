class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    start_date = params[:starts_at].to_date
    end_date = params[:ends_at].to_date
    filtered_events = Event.where('date > ? AND date < ?', start_date, end_date)
    @events = policy_scope(filtered_events).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      flash[:success] = "Event saved!"
      redirect_to event_path(@event.user)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      flash[:success] = "Event updated!"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    if event.destroy
      redirect_to event_path
    else
      render :destroy
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :date, :type, :location, :description, :party_size, :service, :max_price, :min_price)
  end
end
