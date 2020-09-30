class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_treehouse, only: %i[new show]

  def index
    @treehouses = Treehouse.search(params)
  end

  def show
    @booking = Booking.new
  end

  def new
    @treehouse = Treehouse.new
  end

  private

  def set_treehouse
    @treehouse = Treehouse.find(params[:id])
  end
end
