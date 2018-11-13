class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index, :show

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
    @event = @user.event.find(params[:id])
  end

  def update
    @event = @user.event.find(params[:id])
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

  def event_params
    params.require(:event).permit(:user_id, :name, :date, :type, :location, :description, :party_size, :service, :max_price, :min_price)
  end
end
