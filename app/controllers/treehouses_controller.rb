class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @treehouse = Treehouse.find(params[:id])
    @treehouses = policy_scope(Treehouse)
  end

  def index
    @treehouses = Treehouse.search(params)
    @treehouses = policy_scope(Treehouse).order(created_at: :desc)
  end

  def new
    @treehouse = Treehous.new
    authorize @treehouse
  end

end
