class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_treehouse, only: %i[show]

  def show
    @treehouses = policy_scope(Treehouse)
    @booking = Booking.new
    @markers = [{ lat: @treehouse.latitude, lng: @treehouse.longitude }]
  end

  def index
    @treehouses = policy_scope(Treehouse.search(params)).order(created_at: :desc)
  end

  def new
    @treehouse = Treehouse.new
    authorize @treehouse
  end

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

  private

  def treehouse_params
    params.require(:treehouse).permit(:name, :address, :description, :price_per_night, :photo, :beds, :capacity)
  end

  def set_treehouse
    @treehouse = Treehouse.find(params[:id])
  end
end
