class TreehousesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @treehouse = Treehouse.find(params[:id])
  end

  def index
    @treehouses = Treehouse.search(params)
  end
end
