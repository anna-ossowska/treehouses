class BookingsController < ApplicationController
  def index
    @bookings = @user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
