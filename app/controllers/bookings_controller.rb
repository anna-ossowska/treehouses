class BookingsController < ApplicationController
  before_action :set_booking_treehouse, only: %i[new index show create]
  before_action :set_booking, only: %i[new index show]

  def index
    @bookings = @treehouse.bookings
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.treehouse = @treehouse
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to user_path(current_user)
    else
      raise
      redirect_to @treehouse
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:treehouse_id, :check_in, :check_out, :number_of_guests)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_booking_treehouse
    @treehouse = Treehouse.find(params[:treehouse_id])
  end
end
