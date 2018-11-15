class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def professional_dashboard
    @events = Event.all
    @bookings = Booking.all
  end

  def event_dashboard
  end
end
