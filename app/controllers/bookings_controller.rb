class BookingsController < ApplicationController

 #def index
    #@bookings = policy_scope(Booking).order(created_at: :desc)
    #raise
  #end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new(params[:bid_id])
    authorize @booking
    if @booking.save
      flash[:success] = "Event confirmed!"
      redirect_to user_booking_path(current_user.id, @booking)
    else
      render
    end
  end

 private

  def event_params
    params.require(:event).permit(:user_id, :name, :date, :type, :location, :description, :party_size, :service, :max_price, :min_price)
  end

  def bid_params
     params.require(:bid).permit(:user_id, :event_id, :price, :description)
  end

end
