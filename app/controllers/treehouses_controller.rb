class TreehousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_treehouse, only: %i[new show]

  def show
    @treehouses = policy_scope(Treehouse)
    @booking = Booking.new
  end


  def index
    @treehouses = Treehouse.search(params)
    @treehouses = policy_scope(Treehouse).order(created_at: :desc)
  end

  def new
    @treehouse = Treehous.new
    authorize @treehouse
  end

  private

  def set_treehouse
    @treehouse = Treehouse.find(params[:id])
  end

end
