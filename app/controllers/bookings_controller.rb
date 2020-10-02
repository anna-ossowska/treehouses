class BookingsController < ApplicationController
  # These exists to trigger the defined method before performing the actions listed
  before_action :set_booking_treehouse, only: %i[new index show create]
  before_action :set_booking, only: %i[new index show destroy]

  def index
    @bookings = @treehouse.bookings
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  # The booking and the user must be defined in order to save the booking
  def create
    @booking = Booking.new(booking_params)
    @booking.treehouse = @treehouse
    @booking.user = current_user
    authorize @booking

    if @booking.save
      flash[:notice] = "Booking Confirmed!"
      redirect_to user_path(current_user)

    else
      flash[:alert] = "Booking Failed"
      redirect_to @treehouse
    end
  end

  def destroy
    authorize @booking
    @booking.destroy

    flash[:alert] = "Booking Cancelled!"

    redirect_to @booking.user
  end

  private

  # sanitizes params
  def booking_params
    params.require(:booking).permit(:treehouse_id, :check_in, :check_out, :number_of_guests)
  end

  # find the current booking id before action
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # set the treehouse assigned to the booking befire action
  def set_booking_treehouse
    @treehouse = Treehouse.find(params[:treehouse_id])
  end
end
