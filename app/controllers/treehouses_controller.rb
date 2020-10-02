class TreehousesController < ApplicationController
  # These exists to trigger the defined method before performing the actions listed
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_treehouse, only: %i[show destroy edit update]

  def show
    @treehouses = policy_scope(Treehouse)
    @booking = Booking.new
    @markers = [{ lat: @treehouse.latitude, lng: @treehouse.longitude }]
  end

  def index
    @treehouses = policy_scope(Treehouse.search(params)).order(created_at: :desc)
    # setting the lat, long to each treehouse
    @markers = @treehouses.geocoded.map do |treehouse|
      {
        lat: treehouse.latitude,
        lng: treehouse.longitude
      }
    end
  end

  def new
    @treehouse = Treehouse.new
    authorize @treehouse
  end

  # The treehouse and the user must be defined in order to save the booking
  def create
    @treehouse = Treehouse.new(treehouse_params)
    @treehouse.user = current_user
    authorize @treehouse

    if @treehouse.save
      redirect_to @treehouse
    else
      render :new
    end
  end

  def edit
    authorize @treehouse
  end

  def update
    authorize @treehouse
    if @treehouse.update(treehouse_params)
      redirect_to @treehouse.user
    else
      render :edit
    end
  end

  def destroy
    authorize @treehouse
    @treehouse.destroy

    flash[:alert] = "Rental Cancelled!"

    redirect_to @treehouse.user
  end

  private

  # sanitizes params
  def treehouse_params
    params.require(:treehouse).permit(:name, :address, :description, :price_per_night, :photo, :beds, :capacity)
  end

  # sets the current treehouse id before actions
  def set_treehouse
    @treehouse = Treehouse.find(params[:id])
  end
end
